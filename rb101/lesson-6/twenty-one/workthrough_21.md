# 21 

## Rules
- Start with 52 card deck
  - four suits: hearts, diamonds, clubs and spades
  - thirteen values: 2,3,4,5,6,7,8,9,10, jack, queen, king, ace
- The goal is to try to get as close to 21 as possible without going over. 
- if you go over 21, it's a `bust` and you lose

## Setup
- A Dealer and a Player
  - both start with 2 cards
  - the player can see both of his cards, but can only see one of the dealer's cards

## Card Values
- 1  --> 1
- 2 --> 2
- 3 --> 3
- 4 --> 4
- 5 --> 5
- 6 --> 6
- 7 --> 7
- 8 --> 8
- 9 --> 9
- 10 --> 10
- jack --> 10
- queen --> 10
- king --> 10
- ace --> 1 or 11

### The value of `ace`
The value of the `ace` is determined by the other cards that are drawn. If it's higher value (11) would exceed 21, then ace will be worth 1. If it wouldn't exceed 21, then its value will be 1.

 For example, if a 2, an ace and a 5 are drawn, (2, 11, and 5) the total value of this hand would be 18. Since the ace wont push us over 21 in this case, it can have its highest value. 

In contrast, if another ace is drawn and added to the previous hand: (2, ace, 5, ace), having the second ace be its highest value would push us over 21, so the second ace will only be worth 1: ` (1, 11, 5, 1)`.

**Note** 
_What happens when there is a third ace drawn in that same hand? Remember, there are four possible aces because there are four suits in the card deck._

### Turns
## Player goes first
  - **Decision:** `hit` or `stay`
    _The decision depends on the current hand total and what we think the dealer has. For example, if the player has 2 and 4, and the dealer is showing a 10, it makes sense to `hit` because even if there was an ace, that wouldn't push us over 21._

    - `hit`-- this means the player asks for another card, remember you bust when you hit 21
    - `stay` -- this means no new card is requested
The turn is over when there is a bust, or the player `stays`. 
If the player busts, the game is over and the dealer won.

### Dealer turn
_The dealer's turn starts when the player `stays`._
- **Decision:** `hit` or `stay` the rule is more strict with the dealer, he must hit until the total is at least 17, if the dealer busts, then the game is over and the player wins.

### Comparing cards
When both the player and the dealer stay, it's time to compare the total value of the cards and see who has the highest value.
