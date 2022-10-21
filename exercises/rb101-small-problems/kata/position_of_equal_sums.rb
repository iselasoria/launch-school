=begin
You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:

Let's say you are given the array [1,2,3,4,3,2,1]:
Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ([1,2,3]) and the sum of the right side of the index ([3,2,1]) both equal 6.

Let's look at another one.
You are given the array [1,100,50,-51,1,1]:
Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ([1]) and the sum of the right side of the index ([50,-51,1,1]) both equal 1.

Last one:
You are given the array [20,10,-80,10,10,15,35]
At index 0 the left side is []
The right side is {10,-80,10,10,15,35}
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

Note: Please remember that in most programming/scripting languages the index of an array starts at 0.

---------------P 
INPUT: an array of integers, positive, negative or 0
OUTPUT: an integer 

Rules: 
- an empty array is equal to 0 in this problem
- implicit: the input array doesnt have to be odd to have a middle index that yields the expected result

Goal: The return is an integer that represents the position at which the sum of numbers on the left is equal to the sum of the numbers on the right. 


---------------E
[1,2,3,4,3,2,1]----> will return 3 because at that index the sum of [1,2,3] is 6 and the sum of [3,2,1] is also 6

[20,10,-80,10,10,15,35]----> will return 0 because whatever is on the left-hand side of that position returns 0 and on the right, 10,-80,10,10,15,35, also returns 0 when added

---------------D 
Moldel out the solution:

input_arr = [1,2,3,4,3,2,1]

INTERMEDIATE ARRAYS:
  right     |    left     |
------------+-------------+
1           | 2,3,4,3,2,1 |
1,2         | 3,4,3,2,1   |
1,2,3       | 4,3,2,1.    |
1,2,3,4     | 3,2,1       |
1,2,3,4,3   | 2,1         |
1,2,3,4,3,2 | 1           |

SUMS:
 right | left |
-------+------+
1      |  15  |
3      |  13  |
6      |  10  |
10     |   6  |
13     |   3  |
15     |   1  |

---------------A 
- initialize two array object to hold the intermedate step arrays: one for left and one for right hand side
- iterate through the input array 
  - dump the alternating element in the array into the left and one into the right intermediate array
  - perform a sum on each intermediate array
    - check if the sum of the left is equal to the sum on the right 






=end






# test cases
find_even_index([1,2,3,4,3,2,1]) == 3
# find_even_index([1,100,50,-51,1,1])== 1
# find_even_index([1,2,3,4,5,6])== -1
# find_even_index([20,10,30,10,10,15,35])== 3
# find_even_index([20,10,-80,10,10,15,35])== 0
# find_even_index([10,-80,10,10,15,35,20])== 6
# find_even_index(Array(1..100))== -1
# find_even_index([0,0,0,0,0]),0,"Should pick the first index if more cases are valid"
# find_even_index([-1,-2,-3,-4,-3,-2,-1])== 3
# find_even_index(Array(-100..-1))== -1