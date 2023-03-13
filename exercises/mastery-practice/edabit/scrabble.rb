=begin 
* DONE 13m50s
Write a function that returns true if it is possible to build a string with a particular scrabble hand.
Examples

can_build("quavers", ["S", "U", "Q", "V", "A", "#", "#"]) ➞ true

can_build("move", ["M", "U", "T", "V", "E", "J", "#"]) ➞ true

can_build("move", ["M", "U", "T", "V", "E", "J", "S"]) ➞ false

can_build("sharp", ["S", "K", "H", "#", "#", "F", "F"]) ➞ false

Notes
Hashtags "#" represent wild tiles.


I: string and array 
O: boolean 

Rules:
- the "#" is a wild tile --> can be any letter I need 
- first argument is the string I want to build 
- second argument is tiles 

Goal: determine whether I can build the string out of the tiles I have

Examples:
"banter", ["N", "E", "B", "N", "#", "A", "T"]) == true
* check:
        b -> t
        a -> t
        n -> t
        t -> t
        e -> missing
        r -> missing 
        ** possible to build if the number of unaccounted letters in the word are the same as the wildtiles 

"move", ["M", "U", "T", "V", "E", "J", "S"]) == false
* check:
        m -> t
        o -> missing
        v -> t
        e -> t
      * one missing and no wildtiles, not possible to build 

DS:
I: string and aray 
Interm: array 
O: boolean 

Algorithm:
- count the number of wildtiles in the input array 

- init `missing` to 0
- itearte over the string 
  - if the character is not found in the tiles
    - increment `missing`
- if missing matches the number of wildtiles, then it's possible (true), othewise false 
=end

def can_build(word, tiles)
  wildtiles = tiles.count('#')

  missing = 0
  word.chars.each do |letter|
    if !tiles.include?(letter.upcase)
      missing += 1
    end 
  end 
  wildtiles >= missing ? true : false 
end

p can_build("quavers", ["S", "U", "Q", "V", "A", "#", "#"]) == true
p can_build("move", ["M", "U", "T", "V", "E", "J", "#"]) == true
p can_build("banter", ["N", "E", "B", "N", "#", "A", "T"]) == true
p can_build("snake", ["S", "K", "E", "N", "V", "J", "A"]) == true
p can_build("move", ["M", "U", "T", "V", "E", "J", "S"]) == false
p can_build("sharp", ["S", "K", "H", "#", "#", "F", "F"]) == false
p can_build("more", ["M", "R", "I", "E", "U", "S", "F"]) == false
p can_build("talker", ["#", "#", "Z", "V", "P", "A", "K"]) == false
p can_build("talker", ["#", "#", "T", "T", "A", "A", "L"]) == false
p can_build("brain", ["#", "S", "B", "B", "I", "I", "#"]) == false