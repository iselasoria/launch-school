=begin 
Create a function that takes a string str and censors any word from a given array arr. The text removed must be replaced by the given character char.

Examples

censor_string("Today is a Wednesday!", ["Today", "a"], "-") ➞ "----- is - Wednesday!"
censor_string("The cow jumped over the moon.", ["cow", "over"], "*"), "The *** jumped **** the moon.")
censor_string("Why did the chicken cross the road?", ["Did", "chicken", "road"], "*") ➞ "Why *** the ******* cross the ****?"

Notes

N/A

I: string, arr of censored words, censor_ch 
O: string 


Rules:
- string arg is the sentece
- arr arg list of banned word 
- censor_ch is what is meant to replace the banned words 


Examples:
- split the string by space 

- itearte over the array of words # transformation
  - if the word is included in the banned list 
    - gert the nuymber of chars to replace 
    - substitute the word with a censored_ch
- join by space and return 
=end

def censor_string(sentence, banned, ch)
  words = sentence.split

  words.map do |word|
    if banned.include?(word)
      amnt = ch * word.size
      sentence.gsub!(word, "#{amnt}")
    end 
  end 
  sentence
end

p censor_string("The cow jumped over the moon.", ["cow", "over"], "*") == "The *** jumped **** the moon."
p censor_string("Why do my cats keep eating grass?", ["Why", "keep", "eating"], "!") == "!!! do my cats !!!! !!!!!! grass?"
p censor_string("How do I stop myself from using python!?", ["do", "stop", "using"], "-") == "How -- I ---- myself from ----- python!?"
p censor_string("If statements are pretty fun to use.", ["statements", "pretty", "to"], "~~") == "If ~~~~~~~~~~~~~~~~~~~~ are ~~~~~~~~~~~~ fun ~~~~ use."
p censor_string("I'm dyslexic, but that deos'tn matter!", ["that", "matter!"], "?") == "I'm dyslexic, but ???? deos'tn ???????"
p censor_string("I should be doing work but I am doing this instead.", ["should", "but", "this"], "*") == "I ****** be doing work *** I am doing **** instead."