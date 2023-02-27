=begin 
https://www.codewars.com/kata/5375f921003bf62192000746

The word i18n is a common abbreviation of internationalization in the developer community, used instead of typing the whole word and trying to spell it correctly. Similarly, a11y is an abbreviation of accessibility.

Write a function that takes a string and turns any and all "words" (see below) within that string of length 4 or greater into an abbreviation, following these rules:

A "word" is a sequence of alphabetical characters. By this definition, any other character like a space or hyphen (eg. "elephant-ride") will split up a series of letters into two words (eg. "elephant" and "ride").
The abbreviated version of the word should have the first letter, then the number of removed characters, then the last letter (eg. "elephant ride" => "e6t r2e").
Example
abbreviate("elephant-rides are really fun!")
//          ^^^^^^^^*^^^^^*^^^*^^^^^^*^^^*
// words (^):   "elephant" "rides" "are" "really" "fun"
//                123456     123     1     1234     1
// ignore short words:               X              X

// abbreviate:    "e6t"     "r3s"  "are"  "r4y"   "fun"
// all non-letter characters (*) remain in place
//                     "-"      " "    " "     " "     "!"
=== "e6t-r3s are r4y fun!"

I: string 
O: string 

Rules:
- retain the position of special characters 
- a word is:
  - sequence of alphabetical characters only
    - hypenated words are really split by their hyphen into individual words 
- ignore words that are less than 4 chracters long 
- abbreviated words:
  - keep the first and last characters in place 
  - keep track of the characters removed form the middle 
  - the abbreviation is first original letter, followed by number of chars removed, followed by last original letter 


Examples / Model Solution:
"banana" 
 b____a 
 012345
  1234---> 4 
first char + count of letters removed + last character 
'b4a'

"You and I should speak"
  1   2  3  4       5
           s____d s___k
            1234   123
 You and I s4d    s3k

 Data Structures:
 I: string 
 Interim: array of words split at the space / array of characters 
 O: string 

Algorithm:
- init `words_arr` to the result of splitting str by space 

- iterate (transformation) over words_arr # [You, and, I, should, speak]
  - with each iteration # You 
    - if the word is less than or equal to 4 characters 
      - word 
    - otherwise 
      - first letter of word
      - word.size - 2 --> that's how many chars go away  
      - last letter of word 
- join words_arr back with a space 

=end 

def abbreviate(str)
  words_arr = str.split(' ')

  all_my_words = words_arr.map do |word|
                  if !word.chars.all? {|item| ('a'..'z').include?(item)}
                    word.split(/-/)
                  else
                    word
                  end
                end.flatten!
  
end


# p abbreviate("banana") == "b4a"
# p abbreviate("double-barrel") == "d4e-b4l"
p abbreviate("You, and I, should speak.") #== "You, and I, s4d s3k."
p abbreviate("elephant-rides are really fun!")




# def abbreviate(str)
#   words_arr = str.split

#   words_arr.map! do |word|
#     if word.size <= 3
#       word 
#     else
#       abbr = word.chars.first + (word.size - 2).to_s + word.chars.last 
#     end 
#   end.join(' ')
# end


# # test cases 
# p abbreviate("banana") == "b4a"
# p abbreviate("double barrel") == "d4e b4l"
# p abbreviate("You and I should speak") == "You and I s4d s3k"
