=begin 
* DONE 9m0s
* DONE 2m10s second approach
Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
-Function input: String contains only letters, uppercase letters are unique.
Task:
Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb".

I: string 
O: string 

Rules:
- capitals are mothers 
- lowercase are the children 

Examples:
abBA  -- > AaBb 

DS: 
arrays 

Algorithm:
- map to get a downcase and the original 
- sort on the downcase 
- map again to grab the original 


=end 

def find_children(str)
  str.chars.map {|ch| [ch.downcase, ch]}.sort.map{|pair| pair[1]}.join
end
# test cases 

p find_children("abBA") #== "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""