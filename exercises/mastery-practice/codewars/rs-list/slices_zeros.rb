# https://www.codewars.com/kata/5a00a8b5ffe75f8888000080/train/ruby

=begin 
# Given an array containing only zeros and ones, find the index of the zero that, if converted to one, will make the longest sequence of ones.

# For instance, given the array:

# [1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1]
# replacing the zero at index 10 (counting from 0) forms a sequence of 9 ones:

# [1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1]
#                   '------------^------------'
# Your task is to complete the function that determines where to replace a zero with a one to make the maximum length subsequence.

# Notes:

# If there are multiple results, return the last one:
# [1, 1, 0, 1, 1, 0, 1, 1] ==> 5

# The array will always contain only zeros and ones.

I: array of 0 and 1
O: integer --> index of the 0 that if switched to 1 would give me the longest chain of 1s

Rules:
- array will always contain only zeros and 1s 
- find index of the zero that would maximize the chain of 1s
- if there multipple, then return the last 
- Implict:
  - a chain can be formed by 1s looking forwards and backwards

Examples:
            [1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1]
index:          1           5              10             15 16
local_range: arr from last 0 to next zero 
            [1,0,1,1,1] -> 5
                [1,1,1,0,1,1,1,1] -> 8
                        [1,1,1,1,0,1,1,1,1] -> 9
                                  [1,1,1,1,0,0] -> 6
                                            [0,1,1] ->3
*** must ensure that if there are multiple indexes that meet the requirements, return the highest possible 

Data Structures:
I: array 
Interim: arrays 
O: integer 

Algorithm:
*** maybe handle edge cases??
- init local_ranges = {}

- iterate over the input Array and its index 
  - if I find a 0
  - init local variable `back` from last zero up to curent index 
  - init local variable `front` from curent + 1 up to next zero 
  - local_r = back + current + front # [1,0,1,1,1] 
  - set in local_ranges hash the index as key, and value as the local_r 

  #local_ranges no looks like: {1 => [1,0,1,1,1], 5=>[1,1,1,0,1,1,1,1],10=>[1,1,1,1,0,1,1,1,1], 15=>[1,1,1,1,0,0],16=>[0,1,1]}

- get the top 3 of the hash by range size
- select and return the highest key (from the keys array)
=end 



# MY PREVIOUS AND FRIEND'S CODE:

# def replace_zero(arr)
#   local_ranges = {}
#   slices = arr.slice_when {|num| num == 0 }.to_a.each_cons(2).to_a
#  p slices 

#   (0...arr.count(0)).each do |ct_of_zero| # iterating as many times as there are 0s
#     arr.each_with_index do |num, idx| # the original index of each zero 
#       if num == 0
#         p slices[ct_of_zero]

#         local_ranges[idx] = slices[ct_of_zero] # ??????
#       end
#     end
    
#   end

#   # run through the count of 0s in the input array # chunk
#     # itearte through input array and its index 
#       # when I find a 0
#         # set key as index and value as chunk

#   local_ranges

# end


# def replace_zero(arr)
#   idxs = []
#   arr.each.with_index { |n, i| idxs << i if n == 0 }
#   p idxs
#   idxs.map.with_index do |z, idx|
#     left = 0
#     if idx != 0
#       left = (idxs[idx - 1]...z).size
#     end 
#     right = 0
#     if idx != idxs.size - 1
#       right = (z...idxs[idx + 1]).size 
#     end

#     [left + right, z]
#   end
# end 

# def replace_zero(array)
#   longest = 0
#   idx0 = nil
#   split_str = array.join.to_s.split("0")
#   p split_str
#   split_str.each_with_index do |str, idx|
#     current_count = split_str[idx..idx+1].map(&:size).sum + 1
#     if current_count >= longest
#       longest = current_count 
#        ones = split_str[0..idx].map(&:size).sum 
#        zeros = split_str[0..idx].size 
#       idx0 = (ones + zeros) - 1
#     end 
#   end 
#   idx0
# end

def replace_zero(arr)

  return arr.index(1) + 1 if arr.count(0) == arr.size - 1 # if all but one are 0

  local_ranges = {}
  slices = arr.slice_when {|num| num == 0 }.to_a.each_cons(2).to_a # slice in 2s, look backward and forward from the 0
  zeros_found_here = arr.map.with_index{|item, idx| idx if item == 0}.compact! # get locations of 0s

  local_ranges = zeros_found_here.zip(slices).to_h # pair up the zero indexes with their local ranges 

  local_ranges.map do |index, tiny_range|
    if tiny_range.join.chars.last == '0' # when I find a trailing 0, I will delete
      would_be_chain = tiny_range.join[0...-1] # get all but last 0
      local_ranges[index] = would_be_chain # chain if I were to swap the 0 for a 1
    else
      would_be_chain = tiny_range.join # when the trailing char is not zer0, get the whole chain
      local_ranges[index] = would_be_chain
    end
  end
  local_ranges.max_by(3) {|z, chain| chain.size}.to_h.keys.max # grab the biggest two, just in case more meet the critertia, and grab the highest index 
end


p replace_zero([1,0,1,1,1,0,1,1,1,1,0,1,1,1,1,0,0,1,1]) #== 10
p replace_zero([1,1,0,1,1,0,1,1]) == 5
p replace_zero([0,0,0,0,1,0]) == 5
p replace_zero([1,0,0,0,0,0]) == 1
p replace_zero([0,1,0,0,0,0]) == 2