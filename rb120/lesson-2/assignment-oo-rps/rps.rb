module Prettifyable
  attr_reader :msg

  def flashing_display(msg)
    5.times do
      print "\r#{msg}"
      sleep 0.5
      print "\r#{ ' ' * msg.size }" # the lenght of the input message
      sleep 0.5
    end
  end

  def slow_display(msg)
    msg.each_char {|c| putc c ; sleep 0.08; $stdout.flush }
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

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
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
  attr_accessor :move, :name, :running_score

  def initialize
    set_name
    @running_score = 0
  end

  def update_grand_score
    @ultimate_score = Score.new
  end

  def display_running_score
    puts "#{name}'s current score is: #{@running_score}"
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value: "
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose: rock, paper, scissors, lizard, spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
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
  include Prettifyable
  attr_accessor :human, :computer


  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    slow_display("Thanks for playing, good bye!")
  end


  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"

    if human.move.win?(computer.move)
      puts "#{human.name} gets 1 point!"
      human.running_score += 1
    elsif computer.move.win?(human.move)
      puts "#{computer.name} gets one point!"
      computer.running_score += 1
    else
      puts "It's a tie!"
    end
  end

  def display_ultimate_winner
    if human.running_score == 5 # TODO for debug only, come back and make this 10
      # puts "#{human.name} wins the game!"
      flashing_display("#{human.name} wins the game!")
    elsif computer.running_score == 5
      # puts "#{computer.name} is the ultimate winner!"
      flashing_display("#{computer.name} is the ultimate winner!")
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, you must choose y or n."
    end
    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def system_functionality
    sleep(1)
    system("clear")
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      system_functionality
      display_winner
      human.display_running_score
      computer.display_running_score
      display_ultimate_winner
      break if (human.running_score >= 5) || (computer.running_score >= 5) # TODO for debug
    end
    display_goodbye_message
  end
end

RPSGame.new.play
