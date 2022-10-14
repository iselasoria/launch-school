# ! 7 kyu on Ruby 3.0+
=begin
-----------------------INSTRUCTIONS--------------------------------------
Complete the solution so that it returns the number of times the search_test
is found within the full text.
--------------------------PROBLEM----------------------------------------
Questions:
Input: string
Output: integer
---------------------------RULES-----------------------------------------
Explicit: 
- count the number of times a substring shows up

Implicit: 
- 
--------------------------EXAMPLES---------------------------------------
solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1
----------------------------ALGO----------------------------------------
- generate a list of characters in the string
=end

def sub(str)
  str.delete!('_')
  
  indexes = (0..str.length).to_a
  possible_index = indexes.product(indexes)
  
  only_valid_ranges = possible_index.reject do | start_idx, end_idx| 
                        start_idx > end_idx
                      end
  list_of_substrings = only_valid_ranges.map do |starting, ending|
    str[starting..ending]
  end
  list_of_substrings
end
# p sub('aa_bb_cc_dd_bb_e')

def sub_count(str, search_test)
  all_substrings = sub(str)

  sub_counts = all_substrings.tally
  # p all_substrings
  all_substrings.count(search_test)
end




# test cases
p sub_count('aa_bb_cc_dd_bb_e', 'bb') == 2
p sub_count('aaabbbcccc', 'bbb') == 1

# * DONE