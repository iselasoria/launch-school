class Player
  attr_accessor :move
  def initialize(player_type= :human)
    # maybe add functionality to validate com
    @player_type = player_type
    @move = nil
  end

  def choose
    if human?
      choice = nil
      loop do 
        puts "Please choose: rock, paper, scissors:"
        choice = gets.chomp
        break if ['rock','paper','scissors'].include?(choice)
        puts "Sorry, invalid choice."
      end 
      self.move = choice 
    else
      self.move = ['rock','paper','scissors'].sample

    end
  end

  def human?
    @player_type == :human
  end

end




# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer 
  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end 

  def display_welcome_message
    "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing, good bye!"
  end

  def play 
    display_welcome_message
    human.choose 
    computer.choose 
    display_winner 
    display_goodbye_message
  end
end

RPSGame.new.play