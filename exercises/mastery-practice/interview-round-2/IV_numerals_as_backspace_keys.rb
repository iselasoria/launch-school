=begin 
* DONE 04m13s
Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

Your task is to process a string with "#" symbols.

Examples
"abc#d##c"      ==>  "ac"
"abc##d######"  ==>  ""
"#######"       ==>  ""
""              ==>  ""


I: string 
O: string 

Rules:
- treat # as a stroke to the backspace key 
- end result may be empty
- end result must not have any #

DS:
- strings 

Algorithm:
init a results= []

iterate over teh characters in the string 
  - for each character
    - if it's a letter, add it to results_str
    - if it's a #, delete the last letter from the results_str
- return results joined
=end 

def clean_string(str)
  results_str = []

  str.chars.each do |ch|
    if ch != '#'
      results_str << ch 
    else 
      results_str.pop
    end
  end
  results_str.join
end


# test cases 
p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == "" 
p clean_string("831####jns###s#cas/*####-5##s##6+yqw87e##hfklsd-=-28##fds##") == "6+yqw8hfklsd-=-f"