=begin 
You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.



Input: arrays 
Output: array 

Rules:
  - the resulting list returns empty if the inputs are empty 
  - resulting list returns the contents of the non-empty arr if the inputs are an empty array and a non-empty array 
  - resulting list is in ascending order 

Examples:
Input: list1 = [1,2,4], list2 = [1,3,4]
Output: [1,1,2,3,4,4]

Input: list1 = [], list2 = []
Output: []

Input: list1 = [], list2 = [0]
Output: [0]


input: [1,2,4] and [1,3,4]
resulting = []

Data: 
-in: two arrays 
-interim: arrays. maybe hash?
-out: one array 

Algorithm:
- initialize an empty array to hold the results 
- zip and store the two arrays with their sorted versions--> this will make sorting easier down the line
- iterate over the zipped array 
- for each pair
  - iterate over its numbers 
    - if the current number is less than the 
=end 

def merge_two_sorted(arr1, arr2)
  both = arr1.sort!.zip(arr2.sort!)

  results = []
  
  both.each do |pair|
    current_smallest = both.flatten.last
    pair.each do |num|
      if num < current_smallest
        current_smallest = num
      end
    end
    results << current_smallest
  end
  results
end
p merge_two_sorted([1,2,4],[1,3,4]) # => [1, 1, 2, 3, 4, 4]