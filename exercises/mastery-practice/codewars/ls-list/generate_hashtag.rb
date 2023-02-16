=begin 
The marketing team is spending way too much time typing in hashtags.
Let's help them with our own Hashtag Generator!

Here's the deal:

It must start with a hashtag (#).
All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.

Example:
" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
"    Hello     World   "                  =>  "#HelloWorld"
""                                        =>  false


I: string 
O: string 

Rules:
- empty string return false 
- if resulting string is empty, it returns false 
- resulting string must be under 140 characters
- a valid hashtag has no spaces between words 
  - every word begins with a capital 

Implicit:
- count includes hashtag sign 
- if the starting string is over 140 characters automatically return false 

Goal: return a valid hashtag

Examples:
        "" --> return false 
        " " * 200 --> return false on the basis of emtpy string
input:        "Do We have A Hashtag" 
capital:       Do We Have A Hashtag 
space remove:  DoWeHaveAHashtag
add #:        #DoWeHaveAHashtag     


Data Structures:
I: string 
Interim: array --> iterate over words 
O: string 

Algorithm:
- return false if string is empty or if str.unique is a space 

-split string into words 
  - iterate over the words -> transformation 
  - with each iteration 
    - capitalize the first word 

  - join array of words 
  - add a pound sign at the beginning 
  - check for size and if it's longer than 140, return falase otherwise return the joined string 

=end 

# test cases 

def generateHashtag(str)
  return false if str.empty? || str.chars.uniq.join == ' '

  words = str.split

  caps = words.map {|word| word.capitalize}
  hashtag = caps.prepend('#').join

  hashtag.size <= 140 ? hashtag : false 

end


# p generateHashtag("") == false
# p generateHashtag(" " * 200) == false

p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false
