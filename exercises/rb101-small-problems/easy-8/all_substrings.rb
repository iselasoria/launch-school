=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that returns a list of all sub strings of a string. 
The returned list should be ordered by where in the stribng the substring begins.
This means that all substrings that start at position 0 should come first, then all
substring that start at position 1 and so on. Since multiple substrings will 
occur at each position, the substrings that start at position, the substrings at a given
positon should be returned in order from shortest to longest.
You may (and should) use the leading_substrings method you wrote in the previous exercise.
--------------------------PROBLEM----------------------------------------
Questions:
Input: string 
Output: array
---------------------------RULES-----------------------------------------
Explicit: 
- use the method from the previous exercise to grab substrings
- returned list should be ordered by starting position in the original str
- returned list should be ordered from shortest to longest
Implicit: 
--------------------------EXAMPLES---------------------------------------
- set a local variable to hold the new array
- set a variable to hold the iterator
- read the string
- iterate through the array of characters in the string
- with each iteration, make a call to the leading_substrings() method from
  previous exercise
- update iterator
- order the new array by length
- return new array variable

=end
# ----------------------------ALGO----------------------------------------
def leading_substrings(str)
  new_arr = []
  iterator = 1
  letter_list = str.chars

  letter_list.each do |letter|
    new_arr << letter_list.take(iterator).join()
    iterator += 1
  end

  new_arr
end

def substrings(str)
  result_array = []
  counter = 1 #! where does this start?
  list = str.chars

  while counter <= list.size
    result_array << leading_substrings(str)
    p result_array
    list.shift(1) #! removing the firtst element in the array is what will get us to start at the next character with each iteration, but how?
    p list
    counter += 1
  end
  # p result_array
end #! is this meant to be a do/while loop

# test cases
substrings('abcde') #== [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]