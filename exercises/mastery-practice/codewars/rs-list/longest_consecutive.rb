=begin 
You are given an array(list) strarr of strings and an integer k. Your task is to return the first longest string consisting of k consecutive strings taken in the array.

strarr = ["tree", "foling", "trashy", "blue", "abcdef", "uvwxyz"], k = 2

Concatenate the consecutive strings of strarr by 2, we get:

treefoling   (length 10)  concatenation of strarr[0] and strarr[1]
folingtrashy ("      12)  concatenation of strarr[1] and strarr[2]
trashyblue   ("      10)  concatenation of strarr[2] and strarr[3]
blueabcdef   ("      10)  concatenation of strarr[3] and strarr[4]
abcdefuvwxyz ("      12)  concatenation of strarr[4] and strarr[5]

Two strings are the longest: "folingtrashy" and "abcdefuvwxyz".
The first that came is "folingtrashy" so 
longest_consec(strarr, 2) should return "folingtrashy".

In the same way:
longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"

n being the length of the string array, if n = 0 or k > n or k <= 0 return "" (return Nothing in Elm, "nothing" in Erlang).

Note
consecutive strings : follow one after another without an interruption

I: array and integer 
O: string 

Rules:
- Concatenate groups of k elements  
  - [0, 1], [1, 2], [2, 3]... when k = 2
  - [0,1,2], [1,2,3],[2,3,4]...when k = 3
- return an empty string if
  - the input array is empty 
  - k is larger than the length of the array 
  - k is less than or equal to 0 
- n is length of the array 
- k --> concatenation 

Examples: 
["zone", "abigail", "theta", "form", "libe", "zas"] k = 2
["zone", "abigail"] --> "zoneabigail" --> 11
["abigail", "theta"] --> "abigailtheta" --> 12
["theta", "form"]
...

["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"] k = 15
** nothing happens, k is larger than arr.lenght so it doesn't bother checking

["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"] k= 3
["it","wkppv","ixoyx"]
["wkppv","ixoyx", "3452"]
["ixoyx", "3452", "zzzzzzzzzzzz"] ------> clearly the longest 


Data Structures:
I: array of strings and integer 
Interim: arrays 
O: string 

Algorithm:
-return "" if the input array is empty, if k is larger than arr.length or if k <= 0
- slice the array in chunks of k and store in `chunked_arr` 
- iterate over chunked_arr ---> store in `concat_sizes_arr`
  - transform to the concatenation [concatenation, concatsize]
    ex) ["zoneabigail", 11], ["abigailtheta", 12]
- max_by on concat_sizes_arr by the second element --> return 
=end 

def longest_consec(arr, num)
  return "" if arr.empty? || num <= 0 || num > arr.size

  chunked_arr = arr.each_cons(num).to_a

  concat_sizes_arr = chunked_arr.map do |chunk|
                        temp_slice = chunk.join
                        tmp_size = temp_slice.size
                        [temp_slice, tmp_size]
                     end
  concat_sizes_arr.max_by {|gr| gr[1]}[0]
end

# test case 





p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"
p longest_consec(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2) == "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
p longest_consec(["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2) == "wlwsasphmxxowiaxujylentrklctozmymu"

p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3) == "ixoyx3452zzzzzzzzzzzz"


p longest_consec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1) == "oocccffuucccjjjkkkjyyyeehh"




p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15) == "" 
p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0) == ""
p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], -2) == ""
p longest_consec([], 3) == ""