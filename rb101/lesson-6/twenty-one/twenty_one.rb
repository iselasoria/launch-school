require 'pry'
require 'Time'

DECK = [['H','2'],['H','3'],['H','4'],['H','5'],['H','6'],['H','7'],['H','8'],['H','9'],['H','J'],['H','Q'],['H','K'],['H','A'],
        ['S','2'],['S','3'],['S','4'],['S','5'],['S','6'],['S','7'],['S','8'],['S','9'],['S','J'],['S','Q'],['S','K'],['S','A'],
        ['C','2'],['C','3'],['C','4'],['C','5'],['C','6'],['C','7'],['C','8'],['C','9'],['C','J'],['C','Q'],['C','K'],['C','A'],
        ['D','2'],['D','3'],['D','4'],['D','5'],['D','6'],['D','7'],['D','8'],['D','9'],['D','J'],['D','Q'],['D','K'],['D','A'],
      ]




def prompt(msg)
  puts "=> #{msg}"
end

def hit!(deck_of_cards) # * this method is destructive, we can't deal the same card once we gave it out
  new_draw = deck_of_cards.sample
  deck_of_cards.delete(new_draw)
end


def hand!(deck_of_cards)
  first_card = deck_of_cards.sample
  second_card = deck_of_cards.sample
  [deck_of_cards.delete(first_card), deck_of_cards.delete(second_card)]
end

def busted?(updated_hand)
  if updated_hand >= 21
    true
  end
end

def determine_ace_value(hand)
  if calculate_current_hand(hand) < 20
    11
  else
    1
  end
end


def calculate_current_hand(current_hand)
  a_draws = []
  card_values = current_hand.map do |card|
                  if card[1] == 'A'
                    a_draws << 'A'
                  end
    
                  if card[1].to_i.to_s == card[1] # check if it is a number
                    card[1].to_i
                  elsif ['J','Q','K'].include?(card[1])
                    10
                  elsif ['A'].include?(card[1]) && a_draws.count('A') < 2
                    11
                  else
                    1
                  end
                end
  card_values.inject {|sum, num| sum + num }
  
end
# ! Return to this to see of bust condition is necessary
def compare_results(p_score, d_score)
  if (p_score > d_score) && p_score < 21
    'Player'
  elsif (d_score > p_score) && d_score < 21
    'Dealer'
  elsif p_score == d_score
    "It's a tie!"
  else
    'Neither of you '
  end
end

# def player_decision(p_hand,answer)
#   answer = ''

#   loop do
#     prompt("Hit or stay?")
#     answer = gets.chomp.downcase

#     break if answer == 'stay' || answer == 'stay'
#     prompt("Sorry, invalid choice!")
#   end
#   answer
# end

# p determine_ace_value([["C", "J"], ["D","A"]])

# we initialize these outside the loop because we don't want to reset the hand with each hit

# initial cards dealt
player_hand = hand!(DECK)
dealer_hand = hand!(DECK)

player_new_card = []
dealer_new_card = []
bust = false

# each hand at the end
current_hand = []
dealer_current_hand = []

# answer = ''
loop do
  puts "Your initial hand is: #{player_hand} with a value of: #{calculate_current_hand(player_hand)}"
  puts "The dealer has #{dealer_hand} and an unkown card" # todo come back and hide the second card

  current_hand = player_hand
  # todo start at the top to bust
  bust = busted?(calculate_current_hand(current_hand)) #calling this method stack in the break condition was not working, why?
  break if bust


  prompt('Hit or stay?')
  # player_decision(player_hand, answer)
  answer = gets.chomp.downcase

  # binding.pry
  if answer == 'hit'
    player_new_card = hit!(DECK)
    prompt("Your new card is: #{player_new_card}")
    current_hand = player_hand << player_new_card
    # binding.pry
    puts "Your updated hand is now: #{current_hand}"
    puts "Your hand is now worth: #{calculate_current_hand(current_hand)}"
  elsif answer == 'stay'
    current_hand = player_hand # this has to exists here in case player decides to never hit
    puts "You chose to stay, now yielding the turn to the Dealer"
    sleep(4)
  end

  # binding.pry
  bust = busted?(calculate_current_hand(current_hand)) #calling this method stack in the break condition was not working, why?
  break if answer == 'stay' || bust
end



if busted?(calculate_current_hand(current_hand))
  puts "You busted, the Dealer wins!"
else
  dealer_current_hand = dealer_hand
  loop do
    puts "Dealer hand: #{dealer_current_hand}"
    puts "Dealer is deciding whether to hit or not"
    sleep(3)
    puts calculate_current_hand(dealer_hand)
    puts calculate_current_hand(dealer_current_hand)

    if calculate_current_hand(dealer_current_hand) < 17
      dealer_new_card = hit!(DECK)
      prompt("Dealer chose to hit, their new card is: #{dealer_new_card}")
      dealer_current_hand = dealer_hand << dealer_new_card
      puts "The updated hand is now: #{dealer_current_hand}"
      puts "Total updated hand value: #{calculate_current_hand(dealer_current_hand)}"
    else
      dealer_current_hand = dealer_hand
      puts "Dealer chose to stay too, their current had is #{dealer_current_hand} and it is worth #{calculate_current_hand(dealer_current_hand)}"
      puts "We'll need to compare results to determine a winner"
      dealer_score = calculate_current_hand(dealer_current_hand)
      sleep(4)
    end
    dealer_bust = busted?(calculate_current_hand(dealer_current_hand))
    break if dealer_bust || dealer_new_card == nil
  end
 puts "Dealer busted, player wins by default!"
end

player_score = calculate_current_hand(current_hand)
dealer_score = calculate_current_hand(dealer_current_hand)

# only gets executed if neither the dealer nor the player bust
if !busted?(calculate_current_hand(current_hand)) && !busted?(calculate_current_hand(dealer_current_hand))
  puts "#{compare_results(player_score, dealer_score)} wins!!"
end

