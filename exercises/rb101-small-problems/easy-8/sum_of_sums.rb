=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes an array of numbers and then returns the sum of the sums 
of each leading subsequence for that array. You assime that the array contains
at least one number.

--------------------------PROBLEM----------------------------------------
Questions:
Input: an array
Output: an integer
---------------------------RULES-----------------------------------------
Explicit: 
- returns the sum of all the sums of each subsequence
- input array is no empty
Implicit: 
--------------------------EXAMPLES---------------------------------------
- set a local variable and initiate to 0, this will hold the sum 
- set a local variable that will hold a number for the current iteration
- read the array
- iterate through the array
- add the current element to the element in previous iteration
- increase iteration variable by 1

----------------------------ALGO----------------------------------------
=end

def sum_of_sums(arr)
  sum = []
  iterator = 0
  arr.each_with_index do |element, idx|
    # p "Element: #{element}"
    # p "Index: #{idx}"
    if arr.size == 1
      sum << arr[0]
    elsif  idx == 0
      sum << element + arr[idx]
    else
      sum << element + arr[idx-1]
    end
  end
  p sum_of_sums
  sum.inject {|sum, num| sum + num}
end


# test cases
p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) #== 35

# ! come back to this! just need to test a few more test cases 