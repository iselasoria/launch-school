require "yaml"
MESSAGES = YAML.load_file("messages.yml")

module Prettifyable
  attr_reader :msg

  def flashing_display(msg)
    5.times do
      print "\r#{msg}"
      sleep 0.5
      print "\r#{' ' * msg.size}"
      sleep 0.5
    end
  end

  def slow_display(msg)
    msg.each_char do |c|
      putc c
      sleep(0.05)
      $stdout.flush
    end
  end
end

module Orchestratable
  def system_functionality
    sleep(1)
    system("clear")
  end

  def display_rules
    slow_display(MESSAGES["orchestration"]["rules"])
    puts "\n"
  end

  def display_move
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move.win?(computer.move)
      puts "#{human.name} gets 1 point!"
    elsif computer.move.win?(human.move)
      puts "#{computer.name} gets 1 point!"
    else
      puts MESSAGES["orchestration"]["tie"]
    end
  end

  def increment_score
    if human.move.win?(computer.move)
      human.running_score += 1
    elsif computer.move.win?(human.move)
      computer.running_score += 1
    end
  end

  def display_scoreboard # TODO Score class
    human_padding = human.running_score.to_s.center(human.name.size)
    human_size = human.name.size
    comp_padding = computer.running_score.to_s.center(computer.name.size)
    comp_size = computer.name.size

    puts "+" + "-" * human_size + "+" + "-" * comp_size + "+"
    puts "|" + human.name + "|" + computer.name + "|"
    puts "+" + "-" * human_size + "+" + "-" * comp_size + "+"
    puts "|" + human_padding + "|" + comp_padding + "|"
    puts "+" + "-" * human_size + "+" + "-" * comp_size + "+"
  end

  def display_ultimate_winner
    if human.running_score == 5 # TODO
      flashing_display("#{human.name} wins the game!")
    elsif computer.running_score == 5
      flashing_display("#{computer.name} is the ultimate winner!")
    end
    puts "\n"
  end

  def game_round
    human.choose
    computer.choose
    system_functionality
    display_move
  end
end

module Askable
  def prompt(msg)
    puts "=> #{msg}"
  end
end

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
      slow_display(MESSAGES["validation"["invalid_choice"]])
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      prompt(MESSAGES["choice"]["options"])
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      slow_display(MESSAGES["validation"["name_validation"]])
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
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
      answer = gets.chomp
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
