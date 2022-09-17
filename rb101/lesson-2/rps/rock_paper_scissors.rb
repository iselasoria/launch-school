VALID_CHOICES = %w(rock paper scissors lizard spock)
WINNING_SCORE = 3
WINNING_MOVES = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['lizard', 'paper'],
  lizard: ['paper', 'spock'],
  spock: ['scissors', 'rock']
}

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  if WINNING_MOVES[first.to_sym].include? second.to_sym.to_s
    true
  else
    false
  end
end


def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

def display_ultimate_winner(player_total, computer_total)
  if player_total == WINNING_SCORE
    puts "You're the ultimate winner!"
  elsif computer_total == 5
    puts "Sorry, the computer won!"
  end
end

player_tally = 0
computer_tally = 0
loop do
  choice = ''

  loop do
    prompt("Choose one:#{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_tally += 1
  elsif win?(computer_choice, choice)
    computer_tally += 1
  end


  p player_tally
  p computer_tally
  # prompt('Do you want to play again?')
  # answer = gets.chomp
  display_ultimate_winner(player_tally, computer_tally)
  break if player_tally == WINNING_SCORE || computer_tally == WINNING_SCORE
  # display_ultimate_winner(player_tally, computer_tally)
  # break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing, good bye!')
