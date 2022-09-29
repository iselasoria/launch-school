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


def hand(deck_of_cards)
  first_card = deck_of_cards.sample
  second_card = deck_of_cards.sample
  [deck_of_cards.delete(first_card), deck_of_cards.delete(second_card)]
end

def busted?()
  false
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

# answer = nil

loop do
  # initial player hand
  player_hand = hand(DECK)
  puts "Your initial hand is: #{player_hand}"
  p calculate_current_hand(player_hand)

  prompt('Hit or stay?')
  answer = gets.chomp

  new_card = hit!(DECK)
  prompt("Your new card is: #{new_card}")
  current_hand = player_hand << new_card
  break if answer == 'stay' || busted?
end
