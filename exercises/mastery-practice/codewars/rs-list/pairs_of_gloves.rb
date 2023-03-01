=begin 
https://www.codewars.com/kata/58235a167a8cb37e1a0000db

Winter is coming, you must prepare your ski holidays. The objective of this kata is to determine the number of pairs of gloves you can constitute from the gloves you have in your drawer.

Given an array describing the color of each glove, return the number of pairs you can constitute, assuming that only gloves of the same color can form pairs.

Examples:
input = ["red", "green", "red", "blue", "blue"]
result = 2 (1 red pair + 1 blue pair)

input = ["red", "red", "red", "red", "red", "red"]
result = 3 (3 red pairs)

I: arra 
O: integer 

Rules:
- pairs are formed by color (2)


Examples:
["gray","black","purple","purple","gray","black"]
gray-> 2
black -> 2 
purple -> 2 

Data Structures:
arrays 

Algorithm:
- count the colors of the gloves --> hash {gray-> 2,black -> 2 purple -> 2 }
- init gloves_pairs = []  # [1,1,1]
- itereate through the hash 
  - divide the counts by 2--> pairs 
  - push pairs into gloves_pairs
- return sum 
=end 

def number_of_pairs(arr)
  glove_counts = arr.tally

  glove_pairs = []

  glove_counts.each do |color, ct|
    glove_pairs << (ct / 2)
  end
  glove_pairs.sum
end

# https://ryandej.medium.com/understanding-nested-iteration-a-key-to-success-in-rb101-b2dd2efe6807

# https://ryandej.medium.com/how-long-will-it-take-me-a3e3b7f9ac49
# test cases 

p number_of_pairs(["red","red"]) == 1
p number_of_pairs(["red","green","blue"]) == 0
p number_of_pairs(["gray","black","purple","purple","gray","black"]) == 3
p number_of_pairs([]) == 0
p number_of_pairs(["red","green","blue","blue","red","green","red","red","red"]) == 4