# write a method that determines and returns the ascii string value of a string that is passed as an arg.
# The ascii string calue is the sum of the ascii values of every char in the string
# you may use `String#ord` to determine the ascii value of a character.

def ascii_value(str)
  sum = 0
  str.chars.each do |letter|
    sum += letter.ord
  end
  sum
end


# p ascii_value("Rosa")

# # test cases
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0