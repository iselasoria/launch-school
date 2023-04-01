class Move
  VALUES = ['rock', 'paper', 'scissors']

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
      puts "Please choose: rock, paper, scissors:"
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

class Score
  # noun: score 
  # no attr access because all the parts that touch this object are internal 
  # verbs: increments itself, reads from Move 
  # gives feedback to players
  protected # we want a setter but we don't want to expose it 

  def determine_winner
    # compares which is greater, borrows functionality from Move class 
    if human.move > computer.move
      puts "#{human.name} won!"
      self.running_score = human.running_score += 1
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      self.running_score = computer.running_score += 1
    else
      puts "It's a tie!"
    end
  end

  def ultimate_winner
    # is Score object the same as 10
  end

  def feedback
    # hands over the winner status to human or computer objects
  end

end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing, good bye!"
  end

  def display_move
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"

    # todo this moved to the Score class
    if human.move > computer.move
      puts "#{human.name} won!"
      human.running_score += 1
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      computer.running_score += 1
    else
      puts "It's a tie!"
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

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_move
      display_winner
      human.display_running_score
      computer.display_running_score
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
