module GameOrchestration
  @@player_turn = true

  MAX_SCORE = 21

  def initial_hand(deck_of_cards)
    first_card = deck_of_cards.sample
    second_card = deck_of_cards.sample
    [deck_of_cards.delete(first_card), deck_of_cards.delete(second_card)]
  end

  def hit!(deck_of_cards)
    new_draw = deck_of_cards.sample
    deck_of_cards.delete(new_draw)
  end

  def busted?(updated_hand)
    updated_hand >= MAX_SCORE ? true : false
  end

  def determine_ace_value(hand)
    calculate_hand_value(hand) < MAX_SCORE ? 11 : 1
  end

  def take_user_name

    loop do
      puts "Enter your name to learn the rules:"
      answer = gets.chomp.capitalize
      name = answer
      puts "Hi #{name}"
      break if !answer.empty?
    end
  end

  def display_player_hand
    puts "Your initial hand is #{player.hand}."
  end

  def display_dealer_first_card
    puts "The dealer has: #{dealer.hand[0]} and a mystery card"
  end

  def ask_to_make_decision
    puts "Do you want to (h)it or (s)tay?"

    loop do
      answer = gets.chomp
      break if %w(h s).include?(answer)
    end
  end

  def decision
    if @@player_turn
      puts "#{player}".hit_or_stay
    else
      puts "#{dealer}".hit_or_stay
    end
    # if player turn, call player.hit_or_stay
  # else call dealer hit_or_stay
  end
end


