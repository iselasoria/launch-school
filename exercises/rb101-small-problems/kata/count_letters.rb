# ! 6 kyu
=begin
-----------------------INSTRUCTIONS--------------------------------------
In this kata, you have to count lowercase letters in a given string and errturn the letter count in a hash with 'letter' as key
and count as value. The key must be 'symbol`` instead if a string in Ruby
--------------------------PROBLEM----------------------------------------
Questions:
Input: string
Output: hash
---------------------------RULES-----------------------------------------
Explicit: 
- each occurance of a character gets added up
- characters are keys in the form of a symbol
- counts of character occurrence are value is the form of an integer
Implicit: 
--------------------------EXAMPLES---------------------------------------
'activity' ----> {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
----------------------------ALGO----------------------------------------
- read string
- make a list of characters 
- 
=end



def letter_count(str)
  list = str.chars.sort!

  hashi = list.tally
  new_hashi = {}
  hashi.each do |k,v|
    new_hashi[k.to_sym]= v
  end
  new_hashi
end

# test cases

p letter_count('codewars')== {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics')== {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

# * DONE this works, but only on Ruby 3+



# test cases

p letter_count('codewars')#== {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') #== {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics')#== {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
