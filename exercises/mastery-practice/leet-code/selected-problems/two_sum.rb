
def two_sum(arr, target)
  index = (0...arr.size).to_a
  all_possible = index.product(index)
  all_possible.reject! {|pair| (pair[1] == pair[0] || pair[0] > pair[1])}
  hash = {}
  all_possible.each do |pair| 
    hash[pair] = (arr[pair[0],arr[1]]).sum
  end
  hash.select {|idx, sum| sum == target}.max[0]

end

# cruz
def two_sum(nums_arr, target)
  (0...nums_arr.size).each do |idx1|
    (idx1 + 1...nums_arr.size).each do |idx2|
      return [idx1, idx2] if nums_arr[idx1] + nums_arr[idx2] == target
    end 
  end 
end 

# p two_sum([1, 2, 3], 4).sort == [0, 2]
p two_sum([1234, 5678, 9012], 14690).sort == [1, 2]
p two_sum([2, 2, 3], 4).sort == [0, 1]
