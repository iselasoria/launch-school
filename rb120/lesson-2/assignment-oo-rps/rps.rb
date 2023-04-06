require "yaml"
require "../modules/askable.rb"
require "../modules/orchestratable.rb"
require "../modules/prettifyable.rb"
MESSAGES = YAML.load_file("messages.yml")

include Askable
include Orchestratable
include Prettifyable

class Move
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

  def win?(other_move)
    # for the move called on, check if the other includes the array in the hash
    WINNING_MOVES[@value.to_sym].include?(other_move.to_s)
  end

  def to_s
    @value
  end
end

class Rock
  def initialize
    super
  end
end

class Paper
  def initialize
    super
  end
end

class Scissors
  def initialize
    super
  end
end

class Lizard
  def initialize
    super
  end
end

class Spock
  def initialize
    super
  end
end

class Player
  include Askable
  include Orchestratable
  attr_accessor :move, :name, :running_score, :reset_score

  def initialize
    set_name
    @running_score = 0
  end

  def update_grand_score
    @ultimate_score = Score.new
  end
end

class Human < Player
  include Prettifyable

  def set_name
    n = ""
    loop do
      slow_display(MESSAGES["validation"]["welcome"])
      n = gets.chomp
      break unless n.empty?
      slow_display(MESSAGES["validation"]["invalid_choice"])
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      prompt(MESSAGES["choice"]["options"])
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      slow_display(MESSAGES["validation"]["name_validation"])
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Terminator', 'Rusty', 'Chappie', 'Rosie Jetson', "Andy Roid", 'Mr. Roboto'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  include Askable
  include Prettifyable
  include Orchestratable

  attr_accessor :human, :computer

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

  def play # on 2nd rnd immediate ask again
    display_rules
    loop do
      game_round
      display_winner
      increment_score
      display_scoreboard
      display_ultimate_winner
      break if winner_stop_playing? # TODO for debug
    end
    puts "\n"
    display_goodbye_message
  end
end

RPSGame.new.play
