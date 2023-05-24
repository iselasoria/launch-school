
require "/Users/rosasoria/Documents/ft_ls/rb120/lesson-5/oop-twenty-one/modules/game_orchestration.rb"
require "/Users/rosasoria/Documents/ft_ls/rb120/lesson-5/oop-twenty-one/modules/system_functionality.rb"
require "/Users/rosasoria/Documents/ft_ls/rb120/lesson-5/oop-twenty-one/modules/prettifyable.rb"

class Cards
  attr_reader :deck

  @@deck = [['H','2'],['H','3'],['H','4'],['H','5'],['H','6'],['H','7'],['H','8'],['H','9'],['H','J'],['H','Q'],['H','K'],['H','A'],
            ['S','2'],['S','3'],['S','4'],['S','5'],['S','6'],['S','7'],['S','8'],['S','9'],['S','J'],['S','Q'],['S','K'],['S','A'],
            ['C','2'],['C','3'],['C','4'],['C','5'],['C','6'],['C','7'],['C','8'],['C','9'],['C','J'],['C','Q'],['C','K'],['C','A'],
            ['D','2'],['D','3'],['D','4'],['D','5'],['D','6'],['D','7'],['D','8'],['D','9'],['D','J'],['D','Q'],['D','K'],['D','A'],
  ]

  def self.deck
    @@deck
  end

  def add_to_hand(current_hand, new_drawn_card)
    current_hand << new_drawn_card
  end
end


class Participant
include GameOrchestration



  def initialize
    @name = nil
    @hand = [hit!(Cards.deck), hit!(Cards.deck)]
  end

  attr_accessor :name, :hand
end


class Player < Participant
  def hit_or_stay?(current_hand)
    if calculate_hand_value(current_hand)
      hit!(Cards.deck)
    else
      #stay
    end
  end
end

class Dealer < Participant
  UPPER_THRESHOLD = 17

  # dealer always hits if he doesn't have at least 17
  def hit_or_stay?(current_hand)
    if calculate_hand_value(current_hand) <= UPPER_THRESHOLD
      hit!(Cards.deck)
      # add new card to hand
    else
      # stay
      # compare results
    end
  end
end

class Game
include Prettyfiable
include GameOrchestration

attr_reader :player, :dealer


def initialize
  @player = Player.new
  @dealer = Dealer.new
end

  def match
    slow_print("Hello, this is 21.")
    take_user_name
    display_player_hand
    display_dealer_first_card
    ask_to_make_decision
    decision
    display_player_hand
    # intro
    # display player hand
    # display one of the dealers cards
    # player decides

  end
end

twentyone = Game.new
twentyone.match

# joe = Player.new
# p joe