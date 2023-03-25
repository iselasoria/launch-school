=begin 
An authentic vowel skewer is a skewer with a delicious and juicy mix of consonants and vowels. However, the way they are made must be just right:

    Skewers must begin and end with a consonant.
    Skewers must alternate between consonants and vowels.
    There must be an even spacing between each letter on the skewer, so that there is a consistent flavour throughout.

Create a function which returns whether a given vowel skewer is authentic.
Examples

is_authentic_skewer("B--A--N--A--N--A--S") ➞ true
is_authentic_skewer("A--X--E") ➞ false
# Should start and end with a consonant.

is_authentic_skewer("C-L-A-P") ➞ false
# Should alternate between consonants and vowels.

is_authentic_skewer("M--A---T-E-S") ➞ false
# Should have consistent spacing between letters.

I: String 
O: boolean 

Rules:
- An authentic skewer must: 
  - begin and end with consontants 
  - alternate between vowels and consonants 
  - must have even spacing between each letter on the skewer 

Goal: determine whether the input string is an authentic skewer 

Examples:
"B--A--N--A--N--A--S"
 0                -1
 c                 c ---> first rule checks out! 

 letters alternate between consonants and vowels 

 the '-' chunks are all the same size 


"A--X--E"
 0     -1 
 both vowels! 

"C-L-A-P"
 0     -1 
 c      c 
 c c  v c ---> does not alternate 

"T-I-T-A-N-I-C"
 c v c v c v c --> alternates, starts and ends with consontants AND dash chunks are the same size, this is an authentic skewer! 

"M--A---T-E-S"
 c  v   c  v c 
 breaks the rule of dash chunks size 

 Data Structures:
 I: string 
 Interim: array of characters 
 O: boolean 

 Algorithm:
- return false if string first and last NOT consonant, if they're found in vowels 

- create a copy of string `str_dupe`
- create a copy of string `not_special`
- iterate over string 
  - if the current character is not a dash, replace in string_dupe with an empty space # "-- ---- --- - - "
                                        2  4.   3. 1. 1
  - if the mapped sizes of the dash chunks are not unique, then false 

  - delete special chars from not_special and resign
  - iterate over `not_special` # BANANAS 
    - if all the odd indexed characters are vowels, return true 

=end 

def is_authentic_skewer(str)
  # return false if %(A E I O U).include?(str.chars.last) || %(A E I O U).include?(str.chars.first)

  str_dupe = str.dup
  not_special = str.dup 

  str.chars.each do |ch|
    if ch != '-'
      str_dupe.gsub!(ch, ' ')
    end
  end
  return false if str_dupe.split.map(&:size).uniq.size != 1

  not_special = not_special.delete('^A-Z')

  # temp_bool = false 
  # "BANANAS"
  #  0123456
  not_special.chars.each_with_index do |letter, idx|
    return false if idx.odd? && !%( A E I O U).include?(letter)
    #   !temp_bool
    # end
  end
  true
end

p is_authentic_skewer("B--A--N--A--N--A--S") == true
p is_authentic_skewer("L-A-B-O-R-A-T-O-R") == true
p is_authentic_skewer("M-----E-----M-----E-----S") == true

p is_authentic_skewer("C-L-A-P") == false

p is_authentic_skewer("B-E-L-L") == false
p is_authentic_skewer("T-I-T-A-N-I-C") == true
p is_authentic_skewer("J--E--Q--A--H--E--K--A--Y--U--X--A--P--I--F") == true
p is_authentic_skewer("F-U-W") == true

p is_authentic_skewer("A--X--E") == false
p is_authentic_skewer("M--A---T-E-S") == false
p is_authentic_skewer("C--H----E---E-S-E") == false
