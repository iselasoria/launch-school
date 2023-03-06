# * DONE 13m20s
# forgot to copy pedac

def getLengthOfMissingArray(arr)
  p arr
  return 0 if arr.nil?
  return 0 if arr.empty?
  return 0 if arr.any? {|item| item.empty? || item.nil?}
  # return 0 if arr.any? {|item| item.nil?} * come back ehre, maybe?

  sizes_arr = arr.map {|sub| sub.size}.sort
  proper_range_array = (sizes_arr.min..sizes_arr.max).to_a.sort
  diff = proper_range_array - sizes_arr
  diff.first
end

p getLengthOfMissingArray([ [ 1, 2 ], [ 4, 5, 1, 1 ], [ 1 ], [ 5, 6, 7, 8, 9 ]] ) == 3
p getLengthOfMissingArray([ [ 5, 2, 9 ], [ 4, 5, 1, 1 ], [ 1 ], [ 5, 6, 7, 8, 9 ]] ) == 2
p getLengthOfMissingArray([ [ false ], [ false, false, false ] ] ) == 2
p getLengthOfMissingArray([ [ 'a', 'a', 'a' ], [ 'a', 'a' ], [ 'a', 'a', 'a', 'a' ], [ 'a' ], [ 'a', 'a', 'a', 'a', 'a', 'a' ]] ) == 5
p getLengthOfMissingArray([ ]) == 0
