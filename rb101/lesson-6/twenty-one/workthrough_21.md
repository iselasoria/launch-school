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

