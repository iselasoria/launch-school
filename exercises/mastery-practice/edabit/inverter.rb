=begin 
* DONE 10m13s
Create a function that inverts words or the phrase depending on the value of parameter type. A "P" means to invert the entire phrase, while a "W" means to invert every word in the phrase. See the following examples for clarity.

Examples
inverter("This is Valhalla", "P") ➞ "Valhalla is this"

inverter("One fine day to start", "W") ➞ "Eno enif yad ot trats"

inverter("Division by powers of two", "P") ➞ "Two of powers by division"

Notes
    The first character of the returned string should be in uppercase and the rest are in lowercase.
    There will be no empty strings as inputs. Punctuation marks, though quite important for grammatical correctness, are discounted in the input phrases.

I: stirng 
O: strin 

Rules:
- when second arg is 'P', reverse the array or words 
- when the second arg is a 'W', reverse each word in the array, but keep original word order 
- the resulting string should start with a capital and all others lowercased 

Examples:
"This is Valhalla", "P"
"Valhalla is this"
** reversed array 

"One fine day to start", "W"
"Eno enif yad ot trats"
* every word gets reversed 

DS: 
string 
arays 
strings

Algorithm:
- split the str by space into words_arr 

- if second arg is a 'P'
  - reverse the order of the array and join with a space
   - downcase the whole thing, and capitalize  
- otherwise if 'W'
  - itrerate over teh words_arr
    - for each word, 
      - reverse its chars 
  - join back with a space, downcase the whole thing, and capitalize  
=end 

def inverter(str, type)
  words_arr = str.split 
  
  case type 
  when 'P'
    words_arr.reverse.join(' ').downcase.capitalize
  when 'W'
   words_arr.map { |word| word.reverse}.join(' ').downcase.capitalize
  end
end

p inverter("This is Valhalla", "P") == "Valhalla is this"
p inverter("One fine day to start", "W") == "Eno enif yad ot trats"
p inverter("Division by powers of two", "P") == "Two of powers by division"
p inverter("Known for passion in quality", "P") == "Quality in passion for known"
p inverter("Excellence is achievable", "W") == "Ecnellecxe si elbaveihca"
p inverter("The master of your fate the captain of your soul", "W") == "Eht retsam fo ruoy etaf eht niatpac fo ruoy luos"
p inverter("All but one in the middle of it all", "P") == "All it of middle the in one but all"
p inverter("The master of your fate the captain of your soul", "P") == "Soul your of captain the fate your of master the"