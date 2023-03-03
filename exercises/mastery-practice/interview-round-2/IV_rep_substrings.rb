=begin 
* DONE 04m08s
For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times.

The input string consists of lowercase latin letters.

Your function should return :

an array [t, k] (in Ruby and JavaScript)



I: string 
O: array 

Rules:
- find the min substring that repeats a max number of times

Example #1:
  s = "ababab";
  the answer is -->("ab", 3)

Example #2:
  s = "abcde"
  the answer is --> ("abcde", 1)
  because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

DS: 
- char 

ALGORITHM:
-Helper Method: gen_subs(str)

Main Method: repeated_subs(str)
- iterate over the return of gen_subs(str)
  - with each substring
    - calculate: 
      reps = str size / substring size 
      if reps * substring is equal to the whole string, 
        return an array of [substring, reps]
=end 
def repeated_subs(str)
  (0...str.size).each do |st|
    (st...str.size).each do |nd|
      slice = str[st..nd]
      reps = str.size / slice.size 
      return [slice, reps] if slice * reps == str
    end
  end
end

# test cases 
p repeated_subs("ababab") == ["ab", 3]
p repeated_subs("abcde") == ["abcde", 1]