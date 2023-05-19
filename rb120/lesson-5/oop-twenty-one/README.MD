## 21
__

### Rules
---
- start with a 52-card deck
  - four suits: hearts, diamonds, clubs, and spades
  - thirteen values: 2,3,4,5,6,7,8,9,10, jack, queen, king, and ace
  - The goal is to get as close to 21 as possible without going over
  - if you over 21 you `bust` and therefore lose

### Setup
---
- Dealer
  - start with 2 cards
- Player
  - start with 2 cards
  - can see both is his cards
  - can only see one ot the Dealer's cards

### Card Values
Colons can be used to align columns.

| Card    | Value  |
| :-----: |:------:|
| 1       |  1
| 2       |  2
| 3       |  3
| 4       |  4
| 5       |  5
| 6       | 6
| 7       | 7
| 8       | 8
| 9       | 9
| 10      | 10
| jack    | 10
| queen   | 10
| king    | 10
| ace     | 1 or 11


### The value of `ace`

The value of the `ace` is determined by the other cards that are drawn. If using its higher value (11) would exceed 21, then ace will be worth 11. If it would exceed 21, then it will be worth 1.


### Turns
The decision to `hit` or `stay` depends on what the player thinks the _Dealer_ might have. If the player has a 2 and a 4 and the dealer is showing a 10, the player can confidently `hit` because even if the _Dealer_ had an `ace` that would not push the score over 21.

**Player goes first**
- `hit` -- when the player asks for another card

- `stay`-- this means no new card is requested. The current turn is over when there is a bust or the player chooses to `stay`

**Dealer turn**
The _Dealer's_ turn starts when the player `stays`.
- the _Dealer_ must `hit` until the total is at least 17, if the _Dealer_ busts, then the game is over and the player wins.

**Comparing cards**
When both player and _dealer_ stay, it's time to compare the total value of the cards to see who has the highest sum.

---
## Implementation Steps

1. Initialize deck
2. Deal cards to player and dealer
3. Player Turn
  -`hit` or `stay`
  - repeat until bust or stay
4. If player busts, dealer wins
5. Dealer Turn:
  - `hit` or `stay`
  - repeat until total >= 17
6. If dealer busts, player wins
7. Compare cards, declare winner