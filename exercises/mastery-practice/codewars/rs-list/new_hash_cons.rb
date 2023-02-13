=begin 
Complete the function so that it takes an array of keys and a default value and returns a hash (Ruby) with all keys set to the default value.

example:
solution([:draft, :completed], 0) # should return {draft: 0, completed: 0}

I: array and integer --> arr is keys and integer is default value in the new hash 
O: hash 

Rules:
- items in the array are keys in the new hash 
  - symbols 
- default val is given by integer second argument 

example:
[:daft , :completed] and default value 0 
{:daft => 0 , :completed => 0}

Data Structures:
I: array of symbols and integer 
Interim: array 
O: hash

Algorithm:
  - iterate over the array 
    - for each iteration 
      - current element in the array is key and val is default 

=end 
def solution(arr, default_val)
  arr.each_with_object({}) do |item, new_hash|
    new_hash[item] = default_val
  end
end


def solution(keys, default_value)
  keys.each_with_object(Hash.new(0)) { |k, h| h[k] = default_value }
end

p solution([:draft, :completed], 0) == {draft: 0, completed: 0}

