=begin 
Find Number of Repetitions of Substring

Create a function that takes a string as an argument and tells the number of repitions of a substring. It is exactly vice versa to repeating a string function (i.e. if a string "k" is given and asked to make a larger string "z" such that "k" is repated "n' times).

In this scenario, we do the opposite. Given the final string, and ask the number of times the substring is repeated.
Examples

number_of_repeats("abcabcabcabc" ) ➞ 4
number_of_repeats("bcbcbc") ➞ 3
number_of_repeats("llbllbllbllbllbllb") ➞ 6
number_of_repeats("kc") ➞ 1

Notes
    Assume that the substring length is always greater than 1.
    Assume that the string length is always greater than 1.
    Assume that the substring is not always the same.**

I: string 
O: integer 

Rules:
- intake a string 
- find number of reps of a substring that make up the whole string 

Goal: given a whole string, find the number of repetitions of a substring that made the whole string possible 

Examples:
"bcbcbc"
 b 
 bc 
 bcb--->
 bcbc
 bcbcb 
 bcbcbc 
  c 
  cb 
  cbc 
  .....

check that lenght of each substring repeated n times gives me the whole string length 
'bc' 
2 * n = 6
n = 6/2 --> n = str.size / substr.size

Data Structures:
I: string 
Interim: array
O: integer 

Algorith:
Helper Method: gen_substrings(str)
  - generate all 

Main Method: number_of_repeats(str)
- make a call to gen_substrings and store as `subs_arr`

- iterate over subs_arr
  - with each iteration 
    - reps = str.size / subs.size 
    - if reps * subs.size == str.size return reps 
=end 

def gen_substrings(str)
  subs = []

  (0...str.size).each do |starting|
    (starting...str.size).each do |ending|
      subs << str[starting..ending]
    end
  end
  subs
end

def number_of_repeats(str)
  subs_arr = gen_substrings(str)

  subs_arr.each do |item|
    reps = str.size / item.size 
    return reps if item * reps == str 
  end
end

# test cases 
p number_of_repeats("abcabcabcabc" ) == 4
p number_of_repeats("bcbcbc") == 3
p number_of_repeats("llbllbllbllbllbllb") == 6
p number_of_repeats("kc") == 1