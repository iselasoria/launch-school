def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board()
  new_board = {}
  (1..9).each {|num| new_board[num] = ' '}
  new_board
end

def empty_squares(brd)
  brd.keys.select {|num| brd[num] == ' '}
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square (1-9):"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Sorry that is not a valid chice!"
    end
  end
  brd[square] = 'X'
end



board = initialize_board 
# here we can't just pass initialize_board because `board` is what keeps track of the state of the game
display_board(board)

puts board

player_places_piece!(board)
puts board.inspect