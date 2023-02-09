=begin 
# * DONE 17m
Complete the solution so that it takes the object (JavaScript/CoffeeScript) or hash (ruby) passed in and generates a human readable string from its key/value pairs.

The format should be "KEY = VALUE". Each key/value pair should be separated by a comma except for the last pair.

solution({"a" => 1, "b" => '2'}) # should return "a = 1,b = 2"
=end 

# From Ruby 3.0, RSpec is used under the hood.
# See https://rspec.info/
# Defaults to the global `describe` for backwards compatibility, but `RSpec.desribe` works as well.


=begin 
I: hash 
O: string 

Rules:
- returns human-readable string where key=value 
- key/value pairs are separated by a comma except the last 

Example:
{"a" => 1, "b" => '2'}) ===> "a = 1,b = 2"

Data Structures:
I: hash 
Interim: hash/array 
O: string 

Algoriothm
- initialize `chunks_arr` to empty array
- iterate over the hash 
  - for each key value pair 
    - push key, equals sign and value into chunks_arr ['a','=',1, 'b','=', 2]
- get slices of 3 elements from the chunks_arr and iterate ---> tranform and store in `res_arr`
  - with each iterattion
    - join the elements in the chunk 

- join res_arr by a comma
=end 

def solution(hsh)
  chunks_arr = []
  hsh.each do |letter, num|
    chunks_arr << letter << '=' << num
  end
  res_arr = chunks_arr.each_slice(3).to_a.map do |item|
              item.join(' ')
            end
  res_arr.join(',')
end

p solution({"a" => 1, "b" => '2'}) == "a = 1,b = 2"