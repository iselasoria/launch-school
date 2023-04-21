require 'pry'
require "yaml"
require "./modules/systemable.rb"
require "./modules/orchestratable.rb"
require "./modules/movable.rb"

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
  include Movable
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

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER # alternate player
    else
      computer_moves
      @current_marker = HUMAN_MARKER # alternate player
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

  def meet_player
    name = nil
    loop do
      puts MESSAGES["greetings"]["enter_name"]
      name = gets.chomp.capitalize
      break unless !name
    end
  end

  public

  def play
    clear
    main_game
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
