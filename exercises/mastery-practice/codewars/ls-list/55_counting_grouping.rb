# * DONE 15m2s

# Your goal is to write the group_and_count method, which should receive an array as unique parameter and return a hash. Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of the array, and as values the counting of each value.
#
# Example usage:
#
# input = [1,1,2,2,2,3]
#
# group_and_count(input)# == {1=>2, 2=>3, 3=>1}
# The following methods were disabled:
#
# Array#count
# Array#length
#
# I: array
# O: hash
#
# Rules:
# - can't use count or size/length
# - resulting hash should have:
#   - the keys as the unique values of the array
#   - the values as the counting of each item in the array
# - empty or nil input returns nil
#
#
# Examples / Model Solution:
# input = [1,1,2,2,2,3]
# group_and_count(input)# == {1=>2, 2=>3, 3=>1}
#
# original array: [1,1,2,2,2,3]
# occurrances:
# 1 ---> 2
# 2 ---> 3
# 3 ---> 1
#
# unique array:   [1,2,3]
# result array:   [1=> 2, 2=> 3, 3=> 1]
#
# Data:
# - I: array
# - Interim: array
# - O: hash
#
# - Items to track: index
#
# Algorithm:
# - `grouped_hash` will hold the result of grouping the items in the original array
# - iterate over the `grouped_hash`
#   - with each iteration
#     - get the index + 1 of the value --> this is the size
#

def group_and_count(arr)
  grouped_hash = arr.group_by { |item| item }

  grouped_hash.each_with_object({}) do |(unique_val, reps_arr), result_hash|
    reps_arr.each_index do |idx|
      result_hash[unique_val] = idx + 1
    end
  end
end

# test cases
p group_and_count([0, 1, 1, 0]) == { 0 => 2, 1 => 2 }
p group_and_count([1,1,2,2,2,3]) == { 1 => 2, 2 => 3, 3 => 1 }
