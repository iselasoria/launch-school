=begin 
* DONE 34m39s
Reverse or rotate?
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz (ignore the last chunk if its size is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to the left by one position. Put together these modified chunks and return the result as a string.

If sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".


Examples:
revrot("123456987654", 6) --> "234561876549"
revrot("123456987653", 6) --> "234561356789"
revrot("66443875", 4) --> "44668753"
revrot("66443875", 8) --> "64438756"
revrot("664438769", 8) --> "67834466"
revrot("123456779", 8) --> "23456771"
revrot("", 8) --> ""
revrot("123456779", 0) --> "" 
revrot("563000655734469485", 4) --> "0365065073456944"

I: string, and an integer (collection, size)
O: string 

Rules:
- if size is less than 1, return empty str 
- if size > length of string, return empty str 
-to reverse:
  - the chunk is the sum of the cubes of its digits and even

- to rorate:
  - anything not getting reversed, is getting rotated 


Examples:
"733049910872815764" and size = 5
            73304                         99108                                            72815 
 (7**3)+(3**3)+(3**3)+(0**3)+(4**3) (9**3)+(9**3)+(1**3)+(8**3)             (7**3)+(2**3)+(8**3)+(1**3)+(5**3)
            461                             1971                                           989
            odd                             odd                                           odd 
  rotate because not both conditions met rotate because not both conditions met  rotate because not both conditions met 

DS: 
arrays 


Algorithm:
- if req_size is larger than arr size, return empty 
- if string is empty, return empty string 
- get chunks of only `req_size` and store in `chunks`

- iterate over chunks 
  - for each one 
    - calculate the cubes for every digit, and sum it all up and store in `revrot_check`
    - if revrot_check is even
      - reverse chunk 
    - otherwise 
      - rotate chunk 
        - parallele asignemtn 

=end

def revrot(str, req_size)
  return "" if req_size > str.size
  return "" if str.empty? || req_size == 0

  chunks = str.chars.each_slice(req_size).to_a.reject {|item| item.size < req_size}

  chunks.map do |chunk|
    revrot_check = chunk.map {|n| n.to_i ** 3}.sum
    if revrot_check.even?
      # puts "getting rev:#{chunk}"
      chunk.reverse.join
    else
      # puts "getting rotated:#{chunk}"
      chunk.append(chunk.shift).join
    end
  end.join

end

p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("733049910872815764", 5)== "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("563000655734469485", 4) == "0365065073456944"

