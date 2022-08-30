
=begin
-----------------------INSTRUCTIONS--------------------------------------
Given an unordered array and the information that exactly one value in the
array occurs twice (every other value occurs only once), how would you determine 
which value occurs twice? Write a method that will find and return the duplicate
value that is known to be in the array.
--------------------------PROBLEM----------------------------------------
Questions: what is meant by "unordered" array?
Input: an unordered array
Output: the integer that occurs twice in the input array
---------------------------RULES-----------------------------------------
Explicit: only one element occurs twice, all others occur only once
Implicit: 
--------------------------EXAMPLES---------------------------------------
=end
# arre = [3,7,1,7,4]
# set a variable to store the iteration of the input array
# iterate through the array
# push each element in the array into this new array
# if the current element in the iteration is already in the iteration variable,
#   copy that element to a dupe variable
# break the iteration
# return that dupe variable
#----------------------------ALGO----------------------------------------

def find_dup(arre)
  copy_of_arre = []
  dupe = []

  for element in arre do 
    # p arre
    copy_of_arre << element
    if arre.count(element) > 1
      dupe = element
    end

  end
  dupe
end





# def find_dup(arre)
#   copy_of_arre = []
#   dupe = []

#   arre.each do |number|
#     copy_of_arre << number
#     # puts number
#     # puts "Copy of array at this point" + copy_of_arre.to_s
#     # this code below is still checking the same iteration so the last number that was 
#     # pushed to the copy is the one being checked and that's why each and every one of them is included
#     # need to check the next iteration
#     if copy_of_arre.include?(number)
#       # dupe = number
#       puts "#{number} found twice"
#     end
#   end
#   dupe
# end
# p find_dup([1,5,3,1])

# test cases
p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# LS SOLUTION
# def find_dup(array)
#   array.find { |element| array.count(element) == 2 }
# end