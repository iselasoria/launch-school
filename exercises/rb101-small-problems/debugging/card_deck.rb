=begin
We started working on a card game but got stuck. Check out why the code below raises a TypeError.

Once you get the program to run and produce a sum, you might notice that the sum is off: It's lower than it should be. Why is that?
=end

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  # puts 'SUIT'
  # p suit
  cards = deck[suit]
  # puts 'CARDS'
  # p cards
  cards.shuffle!
  player_cards << cards.pop
  # puts "PLAYER CARDS"
  # p player_cards
end

# Determine the score of the remaining cards in the deck

# p player_cards

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  scores = remaining_cards.map do |card| # this gives a list of numerical values of each card.
    score(card)
  end
puts "SUM"
p scores.sum 
  sum += scores.sum
end

# puts sum