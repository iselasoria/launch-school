=begin
https://edabit.com/challenge/cF5pe27MATGvNayJ5n 

A number's factor length is simply its total number of factors.

For instance:

3: 1, 3
# 3's factor length = 2

8: 1, 2, 4, 8
# 8's factor length = 4

36 : 1, 2, 3, 4, 6, 9, 12, 18, 36
# 36's factor length = 9
Create a function that sorts an array by factor length in descending order. If multiple numbers have the same factor length, sort these numbers in descending order, with the largest first.

In the example below, since 13 and 7 both have only 2 factors, we put 13 ahead of 7.

factor_sort([9, 7, 13, 12]) ➞ [12, 9, 13, 7]
# 12 : 6, 9: 3, 13: 2, 7: 2
Examples
factor_sort([1, 2, 31, 4]) ➞ [4, 31, 2, 1]

factor_sort([5, 7, 9]) ➞ [9, 7, 5]

factor_sort([15, 8, 2, 3]) ➞ [15, 8, 3, 2]
Notes
Descending order: numbers with a higher factor length go before numbers with a lower factor length.

I: array 
O: array 

Rules:
- factor legnth--> how many factors a given number has. hwo many numbers it is evenly divisible by 
- order results in desc order 
- if there is a tie for the number of factors, sort by the number that is higher first 

Examples:
[1, 2, 31, 4]
1 -> 1    --> single special case
2 -> 1, 2 ------\____ 31 is bigger, comes first 
31 -> 1, 31_____/
4 -> 4, 2, 1----> most factors, comes first


DS:
- arrays

Algorithm:
Helper Method: factor_count(num)
- init f_count
- init range from 0 to num 
  - each number, divided it by num, and if it divides evenly,increment f_count 

Main Method:
- iterate over array with transform # [[4,3], [31,2],[2, 2], [1,1]]
  - for each number run count_factors(num)
- sort by the second item (the factor count, and then by number)
=end 
def factor_count(num)
  f_count = 0
  range = (1..num).to_a
  range.each do |divisor|
    f_count += 1 if num % divisor == 0
  end
  f_count
end
# p factor_count(31)

def factor_sort(arr)
  num_and_fac = arr.map {|num| [num, factor_count(num)]}

  # p num_and_fac #[fac, og_num]
  # first by number of factors desc, then by how large the og_num is desc 
  num_and_fac.sort_by {|pair| [-pair[1], -pair[0]]}.map{|og| og[0]}
end

p factor_sort([1, 2, 31, 4]) == [4, 31, 2, 1]
p factor_sort([5, 7, 9]) == [9, 7, 5]
p factor_sort([15, 8, 2, 3]) == [15, 8, 3, 2]
p factor_sort([1, 2, 3, 7, 11, 13, 16]) == [16, 13, 11, 7, 3, 2, 1]
p factor_sort([1, 5, 25, 17]) == [25, 17, 5, 1]
p factor_sort([1, 5, 4, 17]) == [4, 17, 5, 1]