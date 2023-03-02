=begin 
* DONE 39m
https://www.codewars.com/kata/5694d22eb15d78fe8d00003a

Write a function groupIn10s which takes any number of arguments, groups them into tens, and sorts each group in ascending order.

The return value should be an array of arrays, so that numbers between 0 and 9 inclusive are in position 0, numbers between 10 and 19 are in position 1, etc.

Here's an example of the required output:

grouped = group_in_10s(8, 12, 38, 3, 17, 19, 25, 35, 50) 

grouped[0]     # [3, 8]
grouped[1]     # [12, 17, 19]
grouped[2]     # [25]
grouped[3]     # [35, 38]
grouped[4]     # nil
grouped[5]     # [50]

I: variabel number of integers 
O: array of arrays 

Rules:
- populate with nils only if there are non-existent tiers sandwiched between exisitng ones 
- empty input will return an empty array 
- groups input numbers into tiers
  - 10s 
  - 20s
  - 30s ...
- if there are no numbers belonging to a given tier, the subarray that would have contained them is nil 
- tiers range from 10, to 100 
  - empty tiers must have a nil as placeholder in theri position

Examples:
1,2,3  --> [ [ 1, 2, 3 ] ]

12, 10, 11, 13, 25, 28, 29, 49, 51, 90
00s - nil 
10s - 10, 11, 12, 13
20s - 25,28,29
30s - nil 
40s - 49
50s - 51
60s - nil 
70s- nil 
80s -nil 
90s - 90 

DS: 
integers 
arrays (nested)
hash 


Algorithm:
- intake the numbers in an array `nums`
- if  nums is empty, return nums 

- init places_hash to groups of 0, 10, 20. etc up to 100 and empty arrays as their values {0 = > [], 10 => [], 20 =[]...}

- iterate over nums 
  - if the current number is less than 10
    - push current number to the array in the hash at key 0
  - if the current number is betweenm 10 and 20
    - push to key at 10
    ....

=end 


def group_in_10s(*nums)
  return nums if nums.empty?
  
  places_hash = {} 
  (0..10).each {|n| places_hash[n] = []}
  
  nums.each do |num|
    case num 
    when 0...10 then places_hash[0] << num
    when 10...20 then places_hash[1] << num
    when 20...30 then places_hash[2] << num
    when 30...40 then places_hash[3] << num
    when 40...50 then places_hash[4] << num
    when 50...60 then places_hash[5] << num
    when 60...70 then places_hash[6] << num
    when 70...80 then places_hash[7] << num
    when 80...90 then places_hash[8] << num
    when 90...100 then places_hash[9] << num
    else 
      places_hash[10] << num
    end 
  end

  results = places_hash.values.map do |group| 
            if group.empty?
              nil 
            else
              group.sort
            end
          end 

  results.pop until results.last != nil 
  results

end 


def group_in_10s(*args)
  result = []
  
  args.sort.group_by { |int| int / 10 }.each do |tens_place, values|
    result[tens_place] = values
  end
  
  result
end
# test cases 

p group_in_10s( 1,2,3 ) ==  [ [ 1, 2, 3 ] ]
p group_in_10s( 8, 12, 38, 3, 17, 19, 25, 35, 50 ) ==  [ [ 3, 8 ], [ 12, 17, 19 ], [ 25 ], [ 35, 38 ], nil, [ 50 ]]
p group_in_10s( 12, 10, 11, 13, 25, 28, 29, 49, 51, 90 ) ==  [ nil, [ 10, 11, 12, 13 ], [ 25, 28, 29 ], nil, [ 49 ], [ 51 ], nil, nil, nil, [ 90 ] ]

p group_in_10s(100) ==  [nil, nil, nil, nil, nil, nil, nil, nil , nil, nil, [ 100 ]]

p group_in_10s() ==  []


# places_hash = {}
# (1..10).each { |n| places_hash[n] = [] }