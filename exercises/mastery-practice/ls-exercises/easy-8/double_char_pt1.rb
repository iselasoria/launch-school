=begin 
* DONE 1m
Write a method that takes a string, and returns a new string in which every character is doubled.
=end 


def repeater(str)
  result = ''

  str.chars.each do |letter|
    result << letter << letter
  end
  result
end
# test cases
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''