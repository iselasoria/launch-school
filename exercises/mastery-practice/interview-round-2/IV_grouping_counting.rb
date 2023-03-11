=begin 
* DONE 17m40s
Your goal is to write the group_and_count method, which should receive and array as unique parameter and return a hash. Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of the array, and as values the counting of each value.

Example usage:

input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}
The following methods were disabled:

Array#count
Array#length

I: array 
O: hash 

Rules:
- empty or nil array returns nil 
- keys are the unique items in the array 
- values are the counts of those items 
- NOTE: can't use tally, or count, or length/size

Examples:
[1,1,2,2,2,3]

1-> 2
2-> 3
3-> 1

DS: 
I: arrays 
Interm: array or hash 
O: hash or nil 

Algorithm:
- return nil if empty or nil is given 

- init `tallied_up` a hash object with empty arays as default keys # {1 => ['*','*'], 2 => ['*','*','*']...}

- init a range from 1 to 30 store in `range_arr` ---> refactor later 

- iterate over the input array 
  - for every item in the array
    - push the shift from the range_arr at that key 
   


- iterate over `tallied_up` --> with object 
  - with each iteration 
    - get the index of the last item and add 1, to get size this is the new value 

=end 

def group_and_count(arr)
  return nil if arr.nil? || arr.empty?

  tallied_up = Hash.new {|h,k| h[k] = []}
  
  range_arr = (1..30).to_a 
  arr.each do |num|
    tallied_up[num] << range_arr.pop
  end


  tallied_up.each_with_object({}) do |(num, tiny_arr), new_hash|
    # p tallied_up[num] 
    # p tiny_arr.index(tiny_arr.last) + 1
    # tallied_up[num] = tiny_arr.index(tiny_arr.last) + 1
    new_hash[num] = tiny_arr.index(tiny_arr.last) + 1
  end

end 

# test cases 
p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}

p group_and_count([]) == nil
p group_and_count(nil) == nil
