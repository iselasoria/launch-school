require 'pry'
require 'Time'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # winning rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # winning cols
                [[1, 5, 9], [3, 5, 7]] # winning diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_SCORE = 5

def joinor(arr, sep=', ', keyword=' or ')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then 
    arr[0].to_s + keyword + arr[-1].to_s
  else
    arr[0, arr.size - 1].join(sep) + sep + keyword +  arr[-1].to_s
  end
end

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board()
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''

  loop do
    # prompt "Choose a square (#{empty_squares(brd).join(',')}):"
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt 'Sorry that is not a valid chice!' # no need for else, this line wont be reached if we break
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count('X') == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil # initialized here so we can access it after the blocks

  # offense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end
  end


  #defense
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square # the risk method returns nil or a square so this break logic makes sense
  end


  # just pick any square
  if !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # forcibly returns value as boolean
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3 # splat operator equivalent of passing line[0], line[1], line[2]
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil # outside the each . If inside each, it will return the rinning lines (each returns the caller) which will always be true and break out loop
end

def display_ultimate_winner(player, comp)
  if (player == WINNING_SCORE) && (player > comp)
    puts "Player is the ultimate winner!"
  elsif (comp == WINNING_SCORE) && (comp > player)
    puts "Computer is the ultimate winner!"
  end
end

def who_goes_first()
  opening = [PLAYER_MARKER, COMPUTER_MARKER].sample
  if opening == PLAYER_MARKER
    'Player'
  else
    'Computer'
  end
end
puts '-------------------------------------------------------------------------------------------------'
puts '|| Welcome to Tic-Tac-Toe                                                                      ||'
puts '|| Complete three consecutive squares to win: rows, columns or diagonals                       ||'
puts '|| You will play five rounds agains the computer and whoever reaches five wins first           ||'
puts '|| will be the ultimate winner                                                                 ||'
puts "|| First, let's decide who will pleace the opening piece:                                      ||"
puts '-------------------------------------------------------------------------------------------------'
sleep(3)
puts "||                                      #{who_goes_first} will go first!                       ||"
puts '-------------------------------------------------------------------------------------------------'
puts sleep(1)

player_tally = 0
computer_tally = 0


loop do
  board = initialize_board
 

  loop do
    display_board(board)

    first_placement = who_goes_first
    if first_placement == 'Player'
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    else
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  if detect_winner(board) == 'Player'
    player_tally += 1
  elsif detect_winner(board) == 'Computer'
    computer_tally += 1
  end


  break if player_tally == WINNING_SCORE || computer_tally == WINNING_SCORE
  
  display_ultimate_winner(player_tally, computer_tally)
  # prompt 'Do you want to play again? (y or n)'
  # answer = gets.chomp
  # break unless answer.downcase.start_with?('y')
end

display_ultimate_winner(player_tally, computer_tally)
prompt('Thanks for playing Tic-Tac-Toe, good bye!')
