=begin
* DONE 27m
You are given a string of numbers between 0-9. Find the average of these numbers and return it as a floored whole number (ie: no decimal places) written out as a string. Eg:

"zero nine five two" -> "four"

If the string is empty or includes a number greater than 9, return "n/a"


I: string with words representing numbers 0-9 
O: string ( represents a single number)

Rules:
- calculate the average of the numbers given in the string 
- average must be rounded down (floored)
- if input is empty, return 'n/a' 
- if the input contains a word tht is not in the collection of words 0-9, return 'n/a'

-Implicit 
- if input string contains a single number, return that numer string--> might get handled by the function itself 

Examples: 
"zero nine five two"
  0     9   5   2 = 16
  size of the collection 4
  average sum/collection size --> 4
  returns "four"

"one two three four five"
  1   2   3     4   5
  15/5
  3

DS: 
I: string 
Intermediate: hash / array (use index)
O: string 


Algorithm:
- return 'n/a' if string is empty

- init variable `english_nums` to a hash of 0..9 zipped with its names 

- split string at spaces 
- return 'n/a' if any of the words in the string are NOT found in the english_nums collection
- init num_equivalent to []
- iterate over the input string of english words--> store in new collection
  # [1,2,3,4,5]
  -calculate the average as the sum of the numeric equivalent / numeric equivalent size ***make sure it's rounded down
  
- retrieve the english equivalet of the average and return 
=end

def average_string(str)
  return 'n/a' if str.empty?

  english_nums = %w(zero one two three four five six seven eight nine).zip(0..9).to_h

  words_arr = str.split
  return 'n/a' if words_arr.any? {|item| !english_nums.include?(item)}

  nums_equivalent = []
  words_arr.each do |word|
    nums_equivalent << english_nums[word]
  end
  avg = (nums_equivalent.sum / nums_equivalent.size)
  english_nums.key(avg)
end 

p average_string("zero nine five two") == "four"
p average_string("four six two three") == "three"
p average_string("one two three four five") == "three"
p average_string("five four") == "four"
p average_string("zero zero zero zero zero") == "zero"
p average_string("one one eight one") == "two"
average_string("one") == "one"
p average_string("") == "n/a"
average_string("ten") == "n/a"
average_string("pippi") == "n/a"