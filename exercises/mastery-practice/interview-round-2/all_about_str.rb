=begin 
* 16m53s
Create a function that, given a string with at least three characters, returns an array of its:

    Length.
    First character.
    Last character.
    Middle character, if the string has an odd number of characters. Middle TWO characters, if the string has an even number of characters.
    Index of the second occurrence of the second character in the format "@ index #" and "not found" if the second character doesn't occur again.

Examples
allAboutStrings("LASA") ➞ [4, "L", "A", "AS", "@ index 3"]
allAboutStrings("Computer") ➞ [8, "C", "r", "pu", "not found"]
allAboutStrings("Science") ➞ [7, "S", "e", "e", "@ index 5"]


I: string 
O: array 

Rules:
- size 
- first ch 
- last ch 
- middle--> 1 or 2
- index of the second occurence of the second char, if applies
  - "@ index idx#"
  - "not found"

Examples:

'programming' == [11, 'p', 'g', 'a', '@ index 4']
size -> 11
f -> p 
l-> g
m -> a 
"@ index 4"

'spring' == [6, 's', 'g', 'ri', 'not found']
size -> 6
f-> s 
l-> g 
m ri 
"not found "

DS:
string 
arrays 

Algorithm:
- init `middle_slice` 
  - arr size/ 2 in the case of odd size strings
  - arr size/2 - 1, length of 1
define 
  - first, last, str_size

- getting the index of the second occurence of the second character 

- iterate over the string chars and their index 
  - when I find the string at second position
    - skip if second index 
    - return index 
=end 

def allAboutStrings(str)
  if str.size.odd?
    middle_slice = str[str.size/2]
  else
    middle_slice = str[(str.size/2) -1, 2]
  end 
  
  last_bit = 'not found'
  str.chars.each_with_index do |ch, idx|
    search = str[1]
    next if idx == 1

    # if str.count(search) == 1
    #   last_bit = "not found"
    # end
    if ch == search
      last_bit = "@ index #{idx}"
    end 
  end


  [str.size, str.chars.first, str.chars.last, middle_slice, last_bit]
end

p allAboutStrings('LASA') == [4, 'L', 'A', 'AS', '@ index 3']
p allAboutStrings('Computer')== [8, 'C', 'r', 'pu', 'not found']
p allAboutStrings('Science') == [7, 'S', 'e', 'e', '@ index 5']
p allAboutStrings('homework') == [8, 'h', 'k', 'ew', '@ index 5']
p allAboutStrings('spring') == [6, 's', 'g', 'ri', 'not found']
p allAboutStrings('break') == [5, 'b', 'k', 'e', 'not found']
p allAboutStrings('programming') == [11, 'p', 'g', 'a', '@ index 4']
p allAboutStrings('bad') == [3, 'b', 'd', 'a', 'not found']