require "yaml"
require "../modules/askable.rb"
require "../modules/orchestratable.rb"
require "../modules/prettifyable.rb"
MESSAGES = YAML.load_file("messages.yml")

include Askable
include Orchestratable
include Prettifyable

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

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value = 'lizard'
  end

  def spock?
    @value = 'spock'
  end

  def history_based_sample
    # TODO
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
  include Orchestratable

  attr_accessor :move, :name, :running_score, :moves_history, :reset_score

  def initialize
    set_name
    @running_score = 0
    @moves_history = []
  end

  def log_move(chosen_move)
    moves_history << chosen_move.value
  end

  def display_log
    puts "Your current moves log: #{@moves_history}"
  end

  def to_s
    @moves_history
  end
end

class Human < Player
  attr_reader :moves_history

  include Prettifyable

  def set_name
    n = ""
    loop do
      slow_display(MESSAGES["validation"]["welcome"])
      n = gets.chomp.capitalize
      break unless n.empty?
      slow_display(MESSAGES["validation"]["invalid_choice"])
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      prompt(MESSAGES["choice"]["options"])
      choice = gets.chomp.downcase
      break if Move::VALUES.include?(choice)
      slow_display(MESSAGES["validation"]["name_validation"])
    end
    self.move = Move.new(choice)
    self.moves_history = log_move(move)
  end
end

class Computer < Player
  def set_name
    self.name = [
      'Terminator', 'Rusty', 'Chappie', 'Rosie Jetson',
      "Andy Roid", 'Mr. Roboto'
    ].sample
  end

  def probability_based_sample(tendencies)
    case rand(100)
    when tendencies[0] then 'rock'
    when tendencies[1] then 'paper'
    when tendencies[2] then 'scissors'
    when tendencies[3] then 'lizard'
    when tendencies[4] then 'spock'
    end
  end

  def assign_personality
    case name
    when 'Terminator'
      then [(0..30), (60..75), (75..90), (90..100), (30..60)]
    when 'Rusty'
      then [(0..25), (25..50), (50..90), (0..0), (90..100)]
    when 'Chappie'
      then [(0..25), (25..50), (50..75), (0..0), (75..100)]
    when 'Rosie Jetson'
      then [(0..25), (25..75), (75..90), (90..100), (0..0)]
    when 'Andy Roid'
      then [(0..33), (33..66), (66..99), (0..0), (0..0)]
    when 'Mr. Roboto'
      then [(0..20), (20..40), (40..60), (60..80), (80..100)]
    end
  end

  def choose
    # self.move = Move.new(Move::VALUES.sample)
    # will likely be a case when we add Mr. Roboto
    self.move = Move.new(probability_based_sample(assign_personality))
  end
end

# Game Orchestration Engine
class RPSGame
  include Askable
  include Prettifyable
  include Orchestratable

  attr_accessor :human, :computer, :moves_history

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_goodbye_message
    slow_display(MESSAGES["orchestration"]["girl_bye"])
  end

  def winner_stop_playing?
    (human.running_score >= 5 && play_again? == false) ||
      (computer.running_score >= 5 && play_again? == false)
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
    puts "You made #{human.moves_history.size} moves."
  end

  def play # on 2nd rnd immediate ask again
    display_rules
    loop do
      game_round
      increment_score
      display_scoreboard
      display_ultimate_winner
      break if winner_stop_playing? # TODO for debug
    end
    puts "\n"
    end_of_round
  end
end

RPSGame.new.play
