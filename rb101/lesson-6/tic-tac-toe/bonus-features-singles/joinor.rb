# this method joins an array using "or" to join its last element to the rest

# def joinor(arr, sep=', ', keyword='or ')
#   if arr.size <= 2
#     arr[0].to_s + keyword + arr[-1].to_s
#   elsif arr.size >= 2 
#     arr[0, arr.size - 1].join(sep) + sep + keyword + arr[-1].to_s
#   end
# end

def joinor(arr, sep=', ', keyword=' or ')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then 
    arr[0].to_s + keyword + arr[-1].to_s
  else
    arr[0, arr.size - 1].join(sep) + sep + keyword +  arr[-1].to_s
  end
end




# p joinor([2,4,6,8])
# test cases
p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and ')    => "1, 2, and 3"