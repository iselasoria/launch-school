=begin 
* DONE 23m30s
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.


I: string 
O: hash 

Rules:
  - string will always contain at least one char 
  - space gets counted as neither
  - count: 
    - capitals
    - lowercase 
    - neither 
  - percentage:
    is/of == x/100
    is*100 = x*of
    (is*100)/of = x

Examples:
'abCdef 123'

lowercase: 5
capitals: 1 
neither: 4

pct = (5 * 100)/10
pct = (4 * 100)/10
pct = (1 * 100)/10

DS:
strings
arrays 
hashes 

Algorithm:
Helper Method: pct(is, of)
  (is*100)/of = x

Main Method: letter_percentages(str)
- initialize a hash containing keys and 0 as values 
- iterate over the input string 
  - when I find a capital, increase cap, 
  - when I find lowercase, incraese lowercase
  - when I find neither, incraese neither count 

- iterate over hash, transform 
  - call pct on each value 
- return modified hash 
=end 

def pct(is, of)
  (is*100)/of
end

def letter_percentages(str)
  count_hash  = {lowercase: 0.0, uppercase: 0.0, neither: 0.0}

  str.each_char do |ch|
    case 
    when ('A'..'Z').include?(ch) 
      count_hash [:uppercase] += 1
    when ('a'..'z').include?(ch)
      count_hash [:lowercase] += 1
    else 
      count_hash [:neither] += 1
    end
  end

  count_hash.each_with_object({}) do |(casetype, ct), pct_hash|
    pct_hash[casetype] = pct(ct, str.size)
  end

end

# test cases 
p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
