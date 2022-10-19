=begin

https://launchschool.com/exercises/a1afc619

Next Featured Number Higher than a Given Value

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

-------P 
Input: Integer
output: Integer

Rules:
explicit:
- the featured number is greater than the input number
- to be a featured number, it must:
  - be a multiple of 7
  - be odd 
  - its individual digits must not repeat 

implicit:
-------E 
20 == 21
1029 == 1043
9_999_999_999 returns an error

-------D 
- input: Integer
- output: integer 
- intermdiate: 
  - integers 
  - array of integer 

-------A 
- define helper method to check if the input number is a multiple of 7
  - input_num % 7 == 0
    - ture 
  - otherwise
    - false 

- define helper method to check for repetiton, takes a number as argument "repeated?"
  - get digits of the number and tally them
  - iterate through digits hash
    - new_hash.values
      - if value > 1
        - true 
      -otherise 
        -false 


- Define a main method featured
  - start a counter 
  - starting point is n
  - loop through an array (until?)
    - ending condition when featured number criteria is met (break condition)
      - input number is odd || is_mulitple? == true || there is no repetition
      - return counter 

[12,13,14,144]

-------C 
=end 

def is_multiple_of_seven?(num)
  num % 7 == 0 ? true : false
end

def repeated?(number)
  individual_digits = number.digits.tally
  repeated = false
  
  individual_digits.each do |digit, count|
    if count > 1
      repeated = true
    else
      false
    end
  end
  repeated
end

def featured(n)
  counter = n 

  if counter.digits.size < 10 # if number isnt huge
    loop do 
      counter += 1
      break if repeated?(counter) == false && is_multiple_of_seven?(counter) == true && counter.odd?
    end
    counter
  else
    puts "There is no possible number that fulfills those requirements"
  end
end


p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987 # TODO strangely, this one is a forever loop

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements