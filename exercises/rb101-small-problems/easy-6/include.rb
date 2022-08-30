=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method named `include?` that takes an array and a search value as
arguments. This method should return true if the search value is in the array
and false if it is not. You may not use Array#include? method in your solution.
--------------------------PROBLEM----------------------------------------
Questions:
Input: an array, and a search value
Output: a boolean
---------------------------RULES-----------------------------------------
Explicit: 
Implicit: array can contain any type of element, integer, nil, etc and so can
the search value.
If an array is empty, any element being searched for will not be there and thus 
this method will return false
--------------------------EXAMPLES---------------------------------------
=end
# arre: [1,2,3,4,5]
# search_value : 2
# set a variable to hold a copy of arre
# loop through arre
# with each iteration, push the element to the copy array
# count the number of times the current element is present and if
#   the count is equal to 1, break the loop 
# return true if count = 1, false if not
#----------------------------ALGO----------------------------------------

# this is not checking out for the second test case
def include?(arre, search_value)
  copy_of_arre = []
  if arre.empty?
    false
  else
    arre.find do |element| 
      if arre.count(element) == 1
        return true
      else
        return false
      end
    end
  end
end



# test cases
# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) #== false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

# LS SOLUTION
def include?(array, value)
  !!array.find_index(value) # Array#find_index is an alias of Array#index. Since integers are immutable its the single object. the `!!` turns it into a boolean equivalent
end

# OR 
def include?(array, value)
  array.each { |element| return true if value == element }
  false
end
p include?([1,2,3,4,5], 6)