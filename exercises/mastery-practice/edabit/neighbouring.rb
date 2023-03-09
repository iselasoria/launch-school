=begin 
TODO 

Create a function that takes a string and checks if every single character is preceded and followed by a character adjacent to it in the english alphabet.

Example: "b" should be preceded and followed by ether "a" or "c" (abc || cba || aba || cbc == true but abf || zbc == false).

Examples
neighboring("aba") ➞ true
neighboring("abcdedcba") ➞ true
neighboring("efghihfe") ➞ false
neighboring("abc") ➞ true
neighboring("qrstuv") ➞ true
neighboring("mnopqrstsrqponm") ➞ true

Notes
All test cases will consist of lower case letters only.

I: string 
O: boolean 

Rules:
  - every single character must have neighbours that are adjacent in the english alphabet 
  - both neighbours must be alphabet-adjacent 
    - order does not matter 
  - strings of single character repeated are false 
  -** safe to ignore first and last characters?? 

Examples:
abcdedcba
_bcdedcb_
 b --> "abc"
  c -->"bcd"
   d-->"cde"

'efghihfe'
 "efg"
  "fgh"
    "ghi"
     "hih"--> still true 
        "ihf"--> "fhi" is equal to the slice of the alphabet that contains focus character in the middle "fhi" == "ghi"?? break

DS: 
I: string 
Interm: arrays 
O: boolean 

Algorithm:
- slice 3 consecutive letters from the alphabet store in hash {"b" => "abc", "h" => "ghi"} store in `alpha_slices`


- slice three conserive characters and store in `string_slices` [["e","f","g"],["f","g","h"]]

- iterate over string_slices ** look out for a and z 
  - with each slice 
    - focus_char is slice middle # f
    - retrieve the slice in the alpha_slices that has that focus character 
      - if slice sorted is equal to the alpha_slice at that focus character, then next 
      - otherwise if slice unique size is 2
          # proper range  104, 105, 106
          # actual_r      104  103  104
          
        next 
      - otherwise, return false 

return true 
=end 

def neighboring(str)
  alpha = (('a'..'z').to_a.each_cons(3).to_a << ["a","b"] << ["z","y"]).sort
  alpha_slices = ('a'..'z').to_a.zip(alpha).to_h

#   - slice three conserive characters and store in `string_slices` [["e","f","g"],["f","g","h"]]
  string_slices = str.chars.each_cons(3).to_a
# - iterate over string_slices ** look out for first and last characters in str 
  string_slices.each do |slice|
    focus_char = slice[1]
    if slice.sort == alpha_slices[focus_char]
      next
    elsif slice.uniq.size == 2 && slice[0] == slice[0].succ || 
      # this is for letters sandwiched between same char 
    else
      return false 
      p "not neighbours"
    end 
  end
  true 
end

p neighboring("abcdedcba") #== true
# p neighboring("aba") == true
p neighboring("efghihfe") #== false
# p neighboring("xyzyx") == true
# p neighboring("mnopqrstsrqponm") == true
# p neighboring("zyz") == true
# p neighboring("aeiou") == false
# p neighboring("cdefg") == true
# p neighboring("qrstuv") == true
# p neighboring("aaaaa") == false