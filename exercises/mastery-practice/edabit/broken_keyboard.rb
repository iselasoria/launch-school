=begin 
https://edabit.com/challenge/uvBFELH3pu44ciXgL

Given what is supposed to be typed and what is actually typed, write a function that returns the broken key(s). The function looks like:

find_broken_keys(correct phrase, what you actually typed)

Examples

find_broken_keys("happy birthday", "hawwy birthday") ➞ ["p"]

find_broken_keys("starry night", "starrq light") ➞ ["y", "n"]

find_broken_keys("beethoven", "affthoif5") ➞ ["b", "e", "v", "n"]

Notes

    Broken keys should be ordered by when they first appear in the sentence.
    Only one broken key per letter should be listed. ***
    Letters will all be in lower case.

I: two strings 
O: an array of letters 

Rules:
  - arg1 is message, arg2 is the typo 
  - keep order of appearance in the message string 
  - only return the INTENDED letter, NOT the typo letter 
  - return a unique array of broken keys 
  - letters are always lowercase 
  - can have special characters and numbers 

Goal: based on the comparison of the message to the typo, find the keys on the keyboard that are broken 

Examples:
input: "starry night" and "starrq light"
      
"starry night" 
"starrq light"
 mmmmm* *mmmm 
      y n 
input: "5678" and  "4678"
"5678"
"4678"
 *mmm 
 5

input: "!!??$$" and "$$!!??"
"!!??$$"
"$$!!??"
 ******
 retrurns unique array of characters in the message string 

Data Structures:
I: two strings 
Interim: arrays or hash 
O: array of strings 

Algorith:
- get characters of message string and zip with characters in typo string and store in `message_typo_matrix` # [[h,h],[a,a],[p,w]]
- iterate over message_typo_matrix and select store in `streamlined_pairs`
  - items that don't have a unique size of 1 
      # [[y,q],[n,l]]
- return message chars unique if streamlined_pairs is the same size as message_typo_matrix
- transform the streamlined nested array into:
  - only the first item in each element 

=end 

def find_broken_keys(message, typo)
  message_typo_matrix = (message.chars).zip(typo.chars)

  streamlined_pairs = message_typo_matrix.select {|pair| pair.uniq.size != 1 }

  # return message.chars.uniq if streamlined_pairs.size == message_typo_matrix.size

  streamlined_pairs.map {|pair| pair[0]}.uniq

end
https://edabit.com/challenge/Lau86uAZbaYcGnb27
p find_broken_keys("happy birthday", "hawwy birthday") == ["p"]


p find_broken_keys("beethoven", "affthoif5") == ["b", "e", "v", "n"]

p find_broken_keys("starry night", "starrq light") == ["y", "n"]
p find_broken_keys("mozart", "aiwgvx") == ["m", "o", "z", "a", "r", "t"]
p find_broken_keys("5678", "4678") == ["5"]
p find_broken_keys("!!??$$", "$$!!??") == ["!", "?", "$"]