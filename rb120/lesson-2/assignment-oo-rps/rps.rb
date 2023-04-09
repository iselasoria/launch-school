require "yaml"
require "../modules/askable.rb"
require "../modules/orchestratable.rb"
require "../modules/prettifyable.rb"
require "../modules/confrontable.rb"

MESSAGES = YAML.load_file("messages.yml")

include Askable
include Orchestratable
include Prettifyable
include Confrontable

class Move
  attr_reader :total_moves, :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  WINNING_MOVES = {
    rock: ['scissors', 'lizard'],
    paper: ['rock', 'spock'],
    scissors: ['lizard', 'paper'],
    lizard: ['paper', 'spock'],
    spock: ['scissors', 'rock']
  }

  def initialize(value)
    @value = value
  end

  def win?(other_move)
    # for the move called on, check if the other includes the array in the hash
    WINNING_MOVES[@value.to_sym].include?(other_move.to_s)
  end

  def to_s
    @value
  end
end

class Player
  include Askable

  attr_accessor :move, :name, :running_score, :moves_history

  @@previous_move = []

  def initialize
    set_name
    @running_score = 0
    @moves_history = []
  end

  def log_move(chosen_move)
    moves_history << chosen_move.value
  end

  def display_log
    favorite = moves_history.group_by { |mc| mc }.map { |k, v| [k, v.size] }
    tendency = favorite.sort_by! { |par| par[1] }.reverse.first
    slow_display("Your go-to move was: #{tendency[0]}, \
you chose that #{tendency[1]} times.")
  end

  def to_s
    @moves_history
  end
end

class Human < Player
  attr_reader :moves_history
  @@human_input = nil

  include Prettifyable

  def shorthand_moves(user_choice)
    case user_choice
    when "r" then @@human_input = 'rock'
    when "p" then @@human_input = 'paper'
    when "s" then @@human_input = 'scissors'
    when "l" then @@human_input = 'lizard'
    when "sp" then @@human_input = 'spock'
    end
  end

  def set_name
    n = ""
    slow_display(MESSAGES["validation"]["welcome"])
    system_functionality
    loop do
      slow_display(MESSAGES["validation"]["enter_name"])
      n = gets.chomp.strip.capitalize
      break unless n.empty?
      slow_display(MESSAGES["validation"]["name_validation"])
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      prompt(MESSAGES["choice"]["options"])
      choice = gets.chomp.downcase
      choice = shorthand_moves(choice)
      break if Move::VALUES.include?(choice)
      slow_display(MESSAGES["validation"]["move_validation"])
      puts "\n"
    end
    self.move = Move.new(choice)
    self.moves_history = log_move(move)
    @@previous_move = move
  end
end

class Computer < Player
  def set_name
    self.name = [
      'Terminator', 'Rusty', 'Chappie', 'Rosie Jetson',
      "Andy Roid", 'Mr. Roboto'
    ].sample
  end

  def choose
    # binding.pry
    self.move = Move.new(probability_based_sample(assign_personality(@@previous_move.value)))
  end
end

# Game Orchestration Engine
class RPSGame
  include Askable
  include Prettifyable
  include Orchestratable

  attr_accessor :human, :computer, :moves_history

  WINNING_SCORE = 5
  @@kill_game = false

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def pre_game
    system_functionality
    display_rules(6)
    display_opponent_face
    puts "\n"
  end

  def display_goodbye_message
    slow_display(MESSAGES["orchestration"]["bye"])
  end

  def winner_stop_playing?
    (human.running_score >= WINNING_SCORE && play_again? == false) ||
      (computer.running_score >= WINNING_SCORE && play_again? == false)
  end

  def play_again?
    answer = nil

    loop do
      prompt(MESSAGES["orchestration"]["go_again"])
      answer = gets.chomp.capitalize
      break if ['y', 'n'].include?(answer.downcase)
      prompt(MESSAGES["validation"]["yes_or_no"])
    end
    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def display_game_stats
    puts "You made a total of #{human.moves_history.size} moves."
  end

  def play
    pre_game
    display_opponent_secret
    loop do
      game_round
      increment_score
      display_scoreboard
      display_ultimate_winner
      handle_new_round
      break if @@kill_game
    end
  end
end

RPSGame.new.play
