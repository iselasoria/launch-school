=begin 
Write a simple parser that will parse and run Deadfish.

Deadfish has 4 commands, each 1 character long:

i increments the value (initially 0)
d decrements the value
s squares the value
o outputs the value into the return array
Invalid characters should be ignored.

parse("iiisdoso")  ==>  [8, 64]

I : string 
O: array of integers 

Rules:
  - tracker starts at 0
  - i-> adds 1
  - d-> subtracts 1 
  - o-> push current tracker into an array 
  - s -> square the current tracker 
- if input string contains characters not in valid list (iods), return [0] --> push tracker to results_arr 
- when the array only outputs --> pushing current tracker (0) into results array as many times as the length of the input string 

Examples:
"iiisdoso" ---> [8, 64]
 0
 1
 1
 1--> tracker= 3
 9 
 8 ---> pushed to results ---> square tracker 
 64 --> pushed to results 
 [8, 64]

 DS:
 I: string
 Interim: array  
 O: array 

 Algorithm:
 - init results_arr 
 - init tracker to 0

 - iterate over the characters in input string 
  - when i, += 1
  - when d, -= 1
  - when o, push tracker to results_arr
  - when s, square tracker and push to results_arr

  - return results_arr

=end

def parse(str)
  # return [0] if str.chars.any? {|letter| !%w(i o d s).include?(letter)}
  results_arr = []

  tracker = 0
  str.each_char do |ch|
    # next if !%w(i o d s).include?(ch)
    case ch
    when 'i'
      tracker += 1
    when 'd'
      tracker -= 1
    when 's'
      tracker = tracker ** 2
    when 'o'
      results_arr << tracker
    end
  end
  results_arr
end 

# test cases 
p parse("ooo") == [0, 0, 0]
p parse("iiisdoso") == [8, 64]
p parse("ioioio") == [1, 2, 3]
p parse("idoiido") == [0, 1]
p parse("isoisoiso") == [1, 4, 25]
p parse("codewarsiio") == [0,3]