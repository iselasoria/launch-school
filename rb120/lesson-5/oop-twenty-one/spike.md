## Description
---

There is a dealer and a player. They both have a hand which gets updated as they play.


The game mechanism gives the dealer and player an initial hand which gets selected from a deck of cards with four suits- hearts, clubs, spades, and diamonds.

We need to:
- determine whether the player or dealer has busted (gone over 21).
- deal a hand
- calculate hand
- determine value of `ace`
- compare results

**Player Logic**

The game mechanism needs to do the following process over and over:
- show initial hands for both dealer and player
- ask to hit or stay
- decision tree:
  - if player hits:
    - a new card gets added to their hand
  - if they stay:
    - yield turn to Dealer
- break if there is a bust or the dealer wins


**Dealer Logic**
- show hand and values
- if dealer hits:
  - update hand and display
- if dealer stays:
  - compare hands

**Score Comparison**
If neither the player or the Dealer busts, the scores get compared and whoever has the highest score wins.