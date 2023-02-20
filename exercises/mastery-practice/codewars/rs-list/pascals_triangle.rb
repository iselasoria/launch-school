=begin 

https://www.codewars.com/kata/5226eb40316b56c8d500030f

In mathematics, Pascal's triangle is a triangular array of the binomial coefficients expressed with formula:

where n denotes a row of the triangle, and k is a position of a term in the row.

Write a function that, given a depth n, returns n top rows of Pascal's Triangle flattened into a one-dimensional array.

n = 1: [1]
n = 2: [1,  1, 1]
n = 4: [1,  1, 1,  1, 2, 1,  1, 3, 3, 1]

I: integer 
O: array of integers 

Rules:
- rows _always_ start with 1 
  - as the number of rows grows, the first 2 items in the next array are a sum of the last number
  ....
  until the end is reached 
- rows _always_ end with 1 

Examples:
  input: 1 
    1
  input: 2
    1
   1 1 
  input: 3
    1
   1 1
  1 2 1
  input: 4
    1
   1 1
  1 2 1
 1 3 3 1

[1,1,1,1,2,1,1,3,3,1]

Data Structures:
I: integer 
Inteirm: array 
O: array 

Notes:
- n is the number of sub-arrays/rows in the pascals triangle 
- a row contains n number of items 
Algorithm:
- initialize an array object `triangle`
- initialize a `rows_count`
- while rows_count is less than n 
  - push the sum of current and next index of the row into the `triangle` 

=end 

def pascalsTriangle(n)
  triangle = [1,1,1]
  rows_count = 0 

  # while rows_count <= n - 2
  until rows_count >= n - 2
    triangle.each_with_index do |item, idx|
      if triangle[idx + 1] != nil 
        p item + triangle[idx + 1]
        triangle << item + triangle[idx + 1]
      else
        triangle << 1
      end
      # triangle << pair.sum
      rows_count += 1
    end

  end
  triangle
end

# p pascalsTriangle(1) #== [1]
# pascalsTriangle(2) #== [1,1,1]
p pascalsTriangle(3) #== [1,1,1,1,2,1]
p pascalsTriangle(4) #== [1,1,1,1,2,1,1,3,3,1]
# pascalsTriangle(6) == [1,1,1,1,2,1,1,3,3,1,1,4,6,4,1,1,5,10,10,5,1]