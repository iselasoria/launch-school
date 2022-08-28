### Algorithms
- A logical sequence of steps for accomplishing a task or objective
  - Closely linked to data structures
  - Series of steps to structure data to produce the required output
- Stay abstract / high-level
  - Avoid implementation detail
  - Don't worry about efficiency for now


** Algorithm **

1. Create an empty 'rows' array to contain all the rows
2. Create the first row array and add it to the overall 'rows' array --> this step seems a bit vague, when that's the case it might make sense to make this chunk a separathe helper method
3. Repeat step 2 until all the necessary rows have been 
created 
  - All rows have been created when the length of the 'rows' array is equal to the input integer
4. Sum the final row
5. Return the sum of the final row

** _Problem: Create a row_ **
Rules:
  - Row is an array
  - Arrays contain integers
  - Integers are consecutive even numbers
  - Integers in each row form part of an overall larger sequence
  - Rows are of different lengths
  - Input: the information needed to create the output
    - The starting integer
    - Length of the row
  - Output: the row itself

Examples:
start : 2, length: 1 --> [2]
start'; 4, length: 2 --> [4, 6]
start: 8, length: 3 --> [8, 10, 12]

Data structures:
- An array of integers

Algorithm:
1. Create an empty 'row' to contain the integers
2. Add the starting integer
3. Increment the starting integer by 2 to get the next integer in the sequence
4. Repeat steps 2 and 3 until the array has reched the correct length
5. Return the 'row' array
