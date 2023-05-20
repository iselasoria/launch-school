module GameOrchestration
  MAX_SCORE = 21

  def hand(deck_of_cards)
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
end