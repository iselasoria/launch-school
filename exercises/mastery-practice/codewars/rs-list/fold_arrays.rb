# https://www.codewars.com/collections/rb109-3
# https://www.codewars.com/kata/57ea70aa5500adfe8a000110
=begin 

In this kata you have to write a method that folds a given array of integers by the middle x-times.

An example says more than thousand words:
Fold 1-times:
[1,2,3,4,5] -> [6,6,3]

A little visualization (NOT for the algorithm but for the idea of folding):

 Step 1         Step 2        Step 3       Step 4       Step5
                     5/           5|         5\          
                    4/            4|          4\      
1 2 3 4 5      1 2 3/         1 2 3|       1 2 3\       6 6 3
----*----      ----*          ----*        ----*        ----*

1 2 3 4 5   --> size 5

1 2 3 4 5 6 --> size 6 

1,6
2,5
3,4

Fold 2-times:
[1,2,3,4,5] -> [6 6 3]-->[9,6]

As you see, if the count of numbers is odd, the middle number will stay. Otherwise the fold-point is between the middle-numbers, so all numbers would be added in a way. ***

The array will always contain numbers and will never be null. The parameter runs will always be a positive integer greater than 0 and says how many runs of folding your method has to do.

If an array with one element is folded, it stays as the same array.

The input array should not be modified!

Have fun coding it and please don't forget to vote and rank this kata! :-)

I have created other katas. Have a look if you like coding and challenges.


I: array of integers and a integer --> array to told and the number of times to fold 
O: array 

Rules:
  - input array should not be modified 
  - second arg dictates how many times to run through the code 
  - if arr size is even, the middle is really two middle elements 
  - if arr size is odd, there is only one number in the middle 
  - single element arrays return the same array 

Examples:

 Step 1         Step 2        Step 3       Step 4       Step5
                     5/           5|         5\          
                    4/            4|          4\      
1 2 3 4 5      1 2 3/         1 2 3|       1 2 3\       6 6 3
----*----      ----*          ----*        ----*        ----*


1 2 3 4 5 6
1,6
2,5
3,4

Data Structures:
I: array 
Interim: arrays/nested?
O: array 

* don't change the original structure 

Algorithm: 
- initi a counter variable to 0 
- set working_arr to point to input array object 

- enter a loop/iteration --> while the counter <= folds
                        - check size of input arr 
                          - if odd 
                            - middle is arr.size / 2
                          - Otherwise 
                            - middle is between arr.size/2 -1 and arr.size/2 

  - if arr size is odd, 
    - left side goes from 0...middle       # [1,2]
    - right side goes from middle + 1..-1 #[4,5]
    - set middle to input array at arr.size/2
  - otherwise if size is even 
    - left side goes from 0..(arr.size/2 - 1)       # [1,2,3]
    - right side goes from arr from arr.size/2..-1 # [4,5,6]
    - set middle = []
  - combine left and right-reversed so that arrays fold on eachother and set to working_arr
  - transform working_arr so that each element is a sum of the sub-elements [6,6]

  - if middle is not empty 
    - working_arr << middle # [6,6,3]
    
=end 

def fold_array(arr, folds) # [ 1, 2, 3, 4, 5 ] runs 1
  counter = 0

  working_arr = arr # [ 1, 2, 3, 4, 5 ]
  # ^^

  while counter < folds
    if working_arr.size.odd? # check size of input array 
      left = working_arr[0...working_arr.size/2]
      right = working_arr[working_arr.size/2+1..-1]
      middle = [working_arr[working_arr.size/2]]
    else
      left = working_arr[0..working_arr.size/2-1]
      right = working_arr[working_arr.size/2..-1]
      middle = []
    end


    working_arr = left.zip(right.reverse).map {|pair| pair.sum}
 
    
    if !middle.empty? 
      working_arr << middle
    else
      working_arr << []
    end.flatten!
    counter += 1 
  end
  working_arr
end

# test cases 
input = [ 1, 2, 3, 4, 5 ]
expected = [ 6, 6, 3 ]
p fold_array(input, 1) ==  expected
    
expected = [ 9, 6 ]
p fold_array(input, 2)== expected
    
expected = [ 15 ]
p fold_array(input, 3) == expected

input = [ -9, 9, -8, 8, 66, 23 ]
expected = [ 14, 75, 0 ]
p fold_array(input, 1) == expected

# p fold_array([1,2,3,4,5,6], 2)
