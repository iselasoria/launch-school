=begin 
* DONE 10m09s
Given a List [] of n integers , find minimum number to be inserted in a list, so that sum of all elements of list should equal the closest prime number .

Notes
List size is at least 2 .

List's numbers will only positives (n > 0) .

Repetition of numbers in the list could occur .

The newer list's sum should equal the closest prime number .

Examples
minimumNumber ({3,1,2}) ==> return (1)
Explanation:
Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime number is (1) , which will make the sum of the List equal the closest prime number (7) .

minimumNumber ({2,12,8,4,6}) ==> return (5)
Explanation:
Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime number is (5) , which will make the sum of the List equal the closest prime number (37) .

minimumNumber ({50,39,49,6,17,28}) ==> return (2)
Explanation:
Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime number is (2) , which will make the sum of the List equal the closest prime number (191) .


I: array of integers 
O: integer 

Goal: find the minimum number to be inserted in the list so that it equals the first prime after the current sum 

Rules:
- sum the numbers in the list 
- find next prime 
- the number we need is the difference between the two 


Examples:
                           [2,12,8,4,6]
sum:                        32
next prime after the sum:   37
return the difference:       5

DS: 
arrays 
integers

Algorithm:
Helper Method: next_prime?(suma)
  - init a tracker equal to the suma
  - increment the tracker, 
    - if the tracker ever turns prime, return the tracker
Main Method:
- init list_sum to the return of summing the input list 
- make a call to next prime and take away the sum you found in the previous step 
- return the diffrence 

=end 
require 'prime'
def next_prime(suma)
  tracker = suma 

  loop do 
    return tracker if tracker.prime?
    tracker += 1
  end
end

def minimum_number(arr)
  list_sum = arr.sum

  next_prime(list_sum) - list_sum
end

# test cases 

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2
