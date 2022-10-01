require 'pry'

DECK = [['H','2'],['H','3'],['H','4'],['H','5'],['H','6'],['H','7'],['H','8'],['H','9'],['H','J'],['H','Q'],['H','K'],['H','A'],
        ['S','2'],['S','3'],['S','4'],['S','5'],['S','6'],['S','7'],['S','8'],['S','9'],['S','J'],['S','Q'],['S','K'],['S','A'],
        ['C','2'],['C','3'],['C','4'],['C','5'],['C','6'],['C','7'],['C','8'],['C','9'],['C','J'],['C','Q'],['C','K'],['C','A'],
        ['D','2'],['D','3'],['D','4'],['D','5'],['D','6'],['D','7'],['D','8'],['D','9'],['D','J'],['D','Q'],['D','K'],['D','A'],
      ]

# subset = DECK.select do |suit|
#            suit[0] == 'S'
#         end
# p subset

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
  if updated_hand >= 22
    true
  end
end

def determine_ace_value(hand)
  puts "Player's hand: #{hand}"
  puts "The value of your current hand is: #{calculate_current_hand(hand)}"
  if calculate_current_hand(hand) < 20
    11
  else
    1
  end
end


def calculate_current_hand(current_hand) # * this is only calculating ace being 11
  card_values = current_hand.map do |card|
                  if card[1].to_i.to_s == card[1] # check if it is a number
                    card[1].to_i
                  elsif ['J','Q','K'].include?(card[1])
                    10
                  else
                    11
                  end
                end
  card_values.inject {|sum, num| sum + num }
  
end


# p determine_ace_value([["C", "J"], ["D","A"]])

# we initialize these outside the loop because we don't want to reset the hand with each hit
player_hand = hand!(DECK)
dealer_hand = hand!(DECK)
new_card = []
bust = false
current_hand = []

loop do
  puts "Your initial hand is: #{player_hand} with a value of: #{calculate_current_hand(player_hand)}"
  puts "The dealer has #{dealer_hand} and an unkown card" # TODO we need to hide the card here

  prompt('Hit or stay?')
  answer = gets.chomp.downcase

  # binding.pry
  if answer == 'hit'
    new_card = hit!(DECK)
    prompt("Your new card is: #{new_card}")
    current_hand = player_hand << new_card
    # binding.pry
    puts "Your updated hand is now: #{current_hand}"
    puts "Your hand is now worth: #{calculate_current_hand(current_hand)}"
  elsif answer == 'stay'
    current_hand = player_hand # this has to exists here in case player decides to never hit
    puts "You chose to stay, now yielding the turn to the Dealer"
  end

  # binding.pry
  bust = busted?(calculate_current_hand(current_hand)) #calling this method stack in the break condition was not working, why?
  break if answer == 'stay' || bust
end



if busted?(calculate_current_hand(current_hand))
  puts "You busted, the Dealer wins!"
else
  loop do
    puts "Dealer hand: #{dealer_hand}"
    puts "Dealer is deciding whether to hit or not"

    if calculate_current_hand(dealer_hand) < 17
      dealer_new_card = hit!(DECK)
      puts dealer_new_card
      prompt("Dealer chose to hit, their new card is: #{dealer_new_card}")
      dealer_current_hand = dealer_hand << dealer_new_card
      p "The updated hand is now: #{dealer_current_hand}"
      p calculate_current_hand(dealer_current_hand)
      puts "Total updated hand value: #{calculate_current_hand(dealer_current_hand)}"
    else
      puts "DEALER CHOSE TO STAY"
    end
    break
  end

end
# puts bust
# if bust
#   puts "You busted, the Dealer wins!"
# else
#   puts "The dealer's hand is: #{dealer_hand}"
#   # here we enter the dealer's turn
#   # loop do
#   #   puts "IN LOOP Dealer's hand is: #{dealer_hand}"
#   #   puts "Total value: #{calculate_current_hand(dealer_hand)}"
#   #   puts 'Dealer is deciding whether to hit or not...'
#   # end

# end
