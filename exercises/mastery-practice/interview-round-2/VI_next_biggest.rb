=begin
* DONE 56m29s 
* DONE 11m43s

You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits. 
examples: 
12 --> 21 
513 --> 531
2017 --> 2071
If no bigger number can be formed using these digits, return -1. 
examples: 
9 --> -1
111 --> -1
531 --> -1 


I: integer 
O: integer 

Goal: to find the next bigger integer that can be formed by the same digits.

Rules:
- number returned must have the same digits as the input number 
- Implicit:
  - single digit integers return -1 
  - unique digit numbers return -1 

Examples:
9   --> -1
111 --> -1
513 --> 531

2017 ---> 2071 **** note: not the biggest, but NEXT BIGGEST

DS: 
I: integers 
interim: arrays 
O: integers 

Algorithm:
- get the digits of the number 
- if digits is length of 1 unique, return -1 
- if the digits are already th biggest number they can form, return -1 

- init a runner starting from input number 
- enter a loop 
  - skip if not all digits are in the input number 
    - when we find a number with all digits 
      - return 

Algorithm:
- get permutations
- turn permutations into numbers again 
- order permutations, 
  - find the first that is greater than the input number
=end 

def next_bigger(num)
  return -1 if num.digits.uniq.size == 1 
  possibilities = num.digits.permutation(num.digits.size).to_a
  possibilities.map! {|item| item.join.to_i}
  possibilities.sort.each do |item|
    return item if item > num
  end 
  return -1 
end

p next_bigger(531) == -1
p next_bigger(111) == -1
p next_bigger(9) == -1
p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(123456789) == 123456798
