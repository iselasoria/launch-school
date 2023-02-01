=begin
Write a method to find the longest common prefix string amongst an array of strings
If no common prefix, return empty string.

All given inputs are in lowercase letters a-z.

I: Array 
O: string 

Rules:
- longest substring that all elements in the array contain 
- if there is no common substring, return and empty string 
- PREFIX ONLY!!!!!!

Examples:
['flower', 'flow', 'flight'] ---> 'fl'

['throne' ,'dungeon'] --> ''

['interspecies', 'interstellar' ,'interstate']

Data Structures:
I: array 
Interim: nested array 
O: string 

Algorithm:
Helper Method: gen_subs(str)
- select for only substrings whose first character is the first int he string 

Main Method: common_prefix(str)
- all_subs_all_words = []
- iterate over the array of words # [flower, flow, flight]
- with every word # flower
  - call gen_subs(str) and push to all_subs_all_words
- sort the all_subs_all_words and store as sorted_subs 
- group by substring to get substring as and array of size as value 
- sort by key size 
=end 

def gen_subs(str)
  subs = []
  (0...str.size).each do |starting|
    (starting...str.size).each do |ending|
      subs << str[starting..ending]
    end
  end
  subs.select {|item| item[0] == str[0] && item.size != str.size}
end


def common_prefix(arr)
  return arr[0] if arr.uniq.size == 1


  all_subs_all_words = []

  arr.each do |word|
    all_subs_all_words << gen_subs(word)
  end
  sorted_subs = all_subs_all_words.flatten.sort

  grouped = sorted_subs.group_by {|item| item}

  return '' if grouped.none? {|k, v| v.size == arr.size}
  
  grouped.map {|subs, reps| [subs, reps.size]}.select {|item| item[1] == arr.size}.max[0]
end

p common_prefix(%w(flower flow flight)) == 'fl'
p common_prefix(%w(dog racecar car)) == ''
p common_prefix(%w(interspecies interstellar interstate)) == 'inters'
p common_prefix(%w(throne dungeon)) == ''
p common_prefix(%w(throne throne)) == 'throne'