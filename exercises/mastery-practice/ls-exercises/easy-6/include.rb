=begin 
Second try:
* DONE 1m37s

Write a method named include? that takes an Array and a search 
value as arguments. This method should return true if the 
search value is in the array, false if it is not. You may not 
use the Array#include? method in your solution.

=end

def include?(arr, term)
  return true if (term.nil? && arr.all? (nil))
  
  search = arr.find {|item| item == term}

  search ? true : false
end

# second try
def include?(arr, search)
  arr.any? do |item|
    item == search
  end
end

# test cases 
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false