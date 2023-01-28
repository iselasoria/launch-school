=begin 
* DONE 52m26s
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits [and] is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.

237
827343 --> sum
** if the sum of all the cubes from all the digits is divisible by 2

If

sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".

revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> "" 
revrot("563000655734469485", 4) --> "0365065073456944"



Example of a string rotated to the left by one position:
s = "123456" gives "234561".


I: string 
O: string 

Rules:
- reject chunks that are less than the requires size
- if the size is less than or equal to 0, return ""
- if the size is greater than the number itself, impossible to chunk, return ""
- break up the string into substrings, 
  - if the sum of all the cubes from every digit in the substring is divisible by 2 // if the number is even, then reverse the number
  - if the sub of cubes of each substring is odd, then push the first digit to the last place 
- the return is a concatenated string of all modifications 

Examples / Model Solution:
'733049910872815764'
73304 99108 72815 764
73304 --> cube each [7 3 3 0 4] ---> sum all ->343 27 27 0 64 = 461 check if even/odd
      --> odd! gets rotated [7 3 3 0 4] --> 33047
99108

72815

Data Structures:
I: string 
Interim: array and hash 
O: string 


Algorithm:
Helper Method: gen_subs(str)
- get substring of chunks of `sz` only, ignore all trailing letters that don't make up 

Main Method: revrot(str, size)
- return "" if size is larger than string size OR if the input string is empty
- make a call to gen_subs(str) and store as `chunks`

- iterate over the chunks 
- capture sums of chunks in `chunk_sums` hash with keys as sums, and values as the chunk itself
- for each chunk, iterate over its digits
  - cube each digit and push to chunk_sums

- initialize transformed_string = ''

- iterate over chunk_sums_hash #=> {461 = [7,3,3,0,4]}
  - if sum of cubes is odd, rotate first digit to the end of the chunk # => chunk_sums_hash[461] #=> [7,3,3,0,4] ---> [3,3,0,4,7]
    - push reversed chunk to transformed_string
  - if sum of cubes is even, reverse its digits of the chunk 
    - access chunk_sums_hash[sum] ---> chunk -> reverse chunk -> store in transformed_string

- return transformed_string

=end



def revrot(str, sz)
  return "" if sz > str.size || str.empty? || sz.zero?

  chunks = str.chars.each_slice(sz).to_a.reject {|c| c.size != sz}

  chunk_sums_hash = {}
  chunks.each do |chunk|
    cube = []
    chunk.each do |num|
      cube << num.to_i ** 3
    end
    chunk_sums_hash[cube.sum] = chunk
  end

  transformed_string = []
  chunk_sums_hash.each do |sum_of_cubes, chunk_arr|
    if sum_of_cubes.odd?
      transformed_string << chunk_arr.rotate
    else
      transformed_string << chunk_arr.reverse
    end
  end
  transformed_string.flatten.join
end


# test cases 
p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
