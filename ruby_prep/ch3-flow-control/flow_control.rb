# E1 Write down whether the following expressions return true or false. 
# Then type the expressions into irb to see the results.

puts (32 * 4) >= 129 # false
puts false != !true # false 
puts true == 4 # false
puts false == (847 == '874') # true
puts (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false # COMPARISON/EQUALITY/AND/OR
# here the one true expression evaluates the whole thing to true

# E2 Write a method that takes a string as an argument. The method should return a new, all-caps version 
# of the string, only if the string is longer than 10 characters. 
# Example: change "hello world" to "HELLO WORLD". (Hint: Ruby's String class has a few methods that would be helpful.

def cap_me(str)
  str.length > 10 ? str.upcase! : str
end

puts cap_me("gatubelitos")

