# Sum of Pairs
# Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

# If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.
=begin
I: array and an integer
O: array (or nil) 

Rules:
- find the first pair that adds up to the target sum 
  - if there is a tie, the return should be that whose second element comes first in the original array 
  - pairs are not necesarily consecutive 
  - if no pairs add up ot the target sum, return nil 


Examples:
[1, 4, 8, 7, 3, 15] == [1, 7]
target sum: 8
1,4 --> 5
1,8 --> 9
1,7... -> 8
  4,8
  4,7..
[1, -2, 3, 0, -6, 1], -6) == [0, -6]

DS: 
I: array 
Interm: arrays 
O: array 

Algorithm:
- generate pairs and store in `pairs`

- iterate over the pairs collection # transformation and store in `sum_pairs`
  - with each pair
    - calculate a sum 
  - return nil for any that don't match target sum 
  - select those pairs whose sum matches the taget sum and store in `target_selection`
  - init temp = []
  - iterate over target_selection 
    - for the first element (pair)
      - check the index of its second element in original array 
  - return pair whose second index is smallest 
=end 

# def sum_pairs(arr, target_sum)
#   pairs = arr.permutation(2).to_a 

#   sum_pairs = pairs.map {|pair| [pair, pair.sum]}
#   if sum_pairs.none? {|item| item[1] == target_sum}
#     return nil 
#   end
#   target_selection = sum_pairs.select {|item| item[1] == target_sum}

#   temp = []
#   target_selection.each_with_index do |item, idx|
#     if arr[idx] == item[0][1]
#       temp << [idx, item[0]]
#     end 
#   end
#   temp 
# end 


# def pares_fx(arr,suma)
#   pares = []

#   arr.combination(2) do |num|
#     num.each do |digit|
#       break if num.sum != suma
#       pares << num
#     end
#   end
#   pares
# end



# def sum_pairs(arr, suma)
#   pairs = pares_fx(arr, suma)
#   pair_sum = {}
#   pairs.map do |pair|
#     pair_sum[pair] = pair.sum
#   end


#  options_hash = pair_sum.select { |pair, yields_sum| yields_sum == suma }

#   result = options_hash.min_by { | pair | [(arr.index(pair[1]) && pair[0] != pair[1]), pair]  }

#   result.nil? ? nil : result[0]

# end


# p sum_pairs([1, 4, 8, 7, 3, 15], 8) == [1, 7]
# p sum_pairs([1, -2, 3, 0, -6, 1], -6) == [0, -6]
# p sum_pairs([20, -13, 40], -7) == nil
# p sum_pairs([1, 2, 3, 4, 1, 0], 2) == [1, 1]
#p sum_pairs([10, 5, 2, 3, 7, 5], 10) #== [3, 7]
# p sum_pairs([4, -2, 3, 3, 4], 8) == [4, 4]
# p sum_pairs([0, 2, 0], 0) == [0, 0]
# p sum_pairs([5, 9, 13, -3], 10) == [13, -3]



def sum_pairs(arr, target)
  arr = arr.uniq if arr.size > 100
  result = []

  (0...arr.size).each do |i|
    (i+1...arr.size).each do |ii|
      result << [arr[i], arr[ii], ii] if arr[i] + arr[ii] == target
    end
  end
  
  result
  result.sort_by! { |subarr| subarr[-1] }
  return nil if result.empty?
  result[0].pop
  result[0]
end

p sum_pairs([10, 5, 2, 3, 7, 5], 10) #== [3, 7]