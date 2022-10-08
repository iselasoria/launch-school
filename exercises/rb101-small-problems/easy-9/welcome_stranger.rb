=begin
-----------------------INSTRUCTIONS--------------------------------------
Create a method that takes two arguments, an array and a hash. The array 
will contain 2 or more elements that, when combied with adjoining spaces,
will provide a person's name. The hash will contain two keys,
`:title` and `"ocupation`, and the appropriate values. Your method should
return a greeting that uses the person's full name, and mentions their
title and occupation.
--------------------------PROBLEM----------------------------------------
Questions: 
Input: an array and a hash
Output: a string
---------------------------RULES-----------------------------------------
Explicit: 
- the hash and the array that are passed in are interpolated into an english sentence
Implicit: 
--------------------------EXAMPLES---------------------------------------
=end
# arr = ['John','Q','Doe']
# p arr.join(' ')
# hashi = {title: 'Master', occupation: 'Plumber'}
# p hashi[:title]
# p hashi[:occupation]
# ----------------------------ALGO----------------------------------------
def greetings(arre, hashi)
  "Hello, #{arre.join(' ')}! Nice to have a #{hashi[:title]} #{hashi[:occupation]} around."
end
# test cases
p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# * DONE