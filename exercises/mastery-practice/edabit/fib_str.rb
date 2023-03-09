=begin 
* DONE 18m21s
A Fibonacci string is a precedence of the Fibonacci series. It works with any two characters of the English alphabet (as opposed to the numbers 0 and 1 in the Fibonacci series) as the initial items and concatenates them together as it progresses in a similar fashion as the Fibonacci series.

Examples
fib_str(3, ["j", "h"]) ➞ "j, h, hj"
fib_str(5, ["e", "a"]) ➞ "e, a, ae, aea, aeaae"
fib_str(6, ["n", "k"]) ➞ "n, k, kn, knk, knkkn, knkknknk"

I: integer and an array 
O: string 

Rules:
- chunks are separated by commas
- takes the two characters in the input array and starts the fibonacci series that way 
  - concatenates the two starting elements in a fibonacci pattern 
- input integer is the number of fibonacci chunks we should have in the series --> this breaks the run 

Examples:
inputs: 3 and ["j", "h"]
starts: ["j", "h"]
round1:  'hj'
series: ["j", "h", "hj"]
* at this point the length of the series is equal to the input number, so it breaks and returns the series joined by a comma 

input: 6 and ["n", "k"]
starts: ["n", "k"]
round1: ["n", "k","kn","knk","knkkn", "knkknknk"] -> size 6 that breaks and returns collection 

DS:
I: integer and array of strings
interim: array 
O: string 

Algorithm:
- init an array to `fibonacci_chunks` and store the secong argument 

- while the fibonacci_chunks size is less than the input number 
  - concatenate the last, and second to last items from fibonacci_chunks and push to fibonacci_chunks

- return the fibonacci_chunks joined by a comma 
=end

def fib_str(max_size, starting_chunk)
  fibonacci_chunks = starting_chunk

  while fibonacci_chunks.size < max_size
    fibonacci_chunks << fibonacci_chunks.reverse.take(2).join
  end
  fibonacci_chunks.join(', ')
end

p fib_str(3, ["j", "h"]) == "j, h, hj"
p fib_str(5, ["e", "a"]) == "e, a, ae, aea, aeaae"
p fib_str(6, ["n", "k"]) == "n, k, kn, knk, knkkn, knkknknk"
p fib_str(7, ["f", "c"]) == "f, c, cf, cfc, cfccf, cfccfcfc, cfccfcfccfccf"
p fib_str(9, ["b", "a"]) == "b, a, ab, aba, abaab, abaababa, abaababaabaab, abaababaabaababaababa, abaababaabaababaababaabaababaabaab"
p fib_str(11, ["z", "x"]) == "z, x, xz, xzx, xzxxz, xzxxzxzx, xzxxzxzxxzxxz, xzxxzxzxxzxxzxzxxzxzx, xzxxzxzxxzxxzxzxxzxzxxzxxzxzxxzxxz, xzxxzxzxxzxxzxzxxzxzxxzxxzxzxxzxxzxzxxzxzxxzxxzxzxxzxzx, xzxxzxzxxzxxzxzxxzxzxxzxxzxzxxzxxzxzxxzxzxxzxxzxzxxzxzxxzxxzxzxxzxxzxzxxzxzxxzxxzxzxxzxxz"