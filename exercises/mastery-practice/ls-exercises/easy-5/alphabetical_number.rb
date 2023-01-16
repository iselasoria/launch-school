=begin
* DONE 18m41s 
Write a method that takes an Array of Integers between 0 and 19, 
and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten,
eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen


Input: array of integers
Output: array of integers 

Rules:
- sort based on the english equivalent 
  - alphabetical
- returns the numbers in the original collection 

Examples: 
(0..19).to_a == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0 
]

[1,8,4] ---> eight, four, one ---> [8,4,1]


Data Structures:
in: array 
interim: hash 
out: array 

Algorithm:
- generate a hash containing the number in in the array and the english equivalent
- iterate over the input array, sorted
  - for each number 
    - retrieve the enlglish word and then again the number
=end


MAIN_HASH = {
  0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5=> 'five',
  6 => 'six', 7 => 'seven', 8 =>'eight', 9 =>'nine', 10 =>'ten',
  11 =>'eleven', 12 =>'twelve', 13 =>'thirteen', 14 =>'fourteen', 15 =>'fifteen', 
  16 =>'sixteen', 17 =>'seventeen', 18 =>'eighteen', 19 =>'nineteen'
}

def alphabetic_number_sort(arr)
  arr.map {|num| MAIN_HASH[num] }.sort.map {|word| MAIN_HASH.key(word)}
end

# test cases 
p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,6, 16, 10, 13, 3, 12, 2, 0]