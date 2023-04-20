require 'pry'
require "yaml"
require "./modules/systemable.rb"
require "./modules/orchestratable.rb"

MESSAGES = YAML.load_file("messages.yml")

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals
  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new() }
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.select { |_, sq| sq.unmarked? }.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker # !! relies on truthiness to return either true/false
  end

  # return wining marker or return nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares) # the new method to implement
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new() }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts ""
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
    puts ""
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  include Systemable
  include Orchestratable

  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  private

  # def display_welcome_message
  #   # puts "Welcome to TTT!"
  #   MESSAGES["greetings"]["welcome"]
  # end

  # def display_goodbye_message
  #   # puts "Thanks for playing TTT, goodbye!"
  #   MESSAGES["greetings"]["goodbye"]
  # end

  def display_board
    puts "You're a #{human.marker}."
    puts "Computer is a #{computer.marker}."
    draw_pretty
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}):"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      MESSAGES["validation"]["invalid_square"]
    end

    # binding.pry
    # whose responsiblity is it, the player or board?
    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER # alternate player
    else
      computer_moves
      @current_marker = HUMAN_MARKER # alternate player
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def display_result
    # display_board
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts MESSAGES["results"]["human_winner"]
    when computer.marker
      puts MESSAGES["results"]["comp_winner"]
    else
      puts MESSAGES["results"]["tie"]
    end
  end

  def play_again?
    answer = nil
    loop do
      puts MESSAGES["play"]["ask"]
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts MESSAGES["validation"]["invalid_bool"]
    end
    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts MESSAGES["play"]["again"]
    puts "\n"
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def meet_player
    name = nil
    loop do
      puts MESSAGES["greetings"]["enter_name"]
      name = gets.chomp.capitalize
      break unless !name
    end
  end

  def main_game
    meet_player
    loop do
      display_board
      player_move
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  public

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
