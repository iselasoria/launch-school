# The PEDAC Process

## P: Understanding the Problem

- Establish the rules/define the boundaries of the problem
  - Assess available information
  - Restate explicit requirements
  - Identify implicit requirements
- Spend enough time here, don't rush this step!

**General Example**
Give a string, produce a snew string with every other word removed.

- Explicit requirements:
- input: string
- output: new string
- remove every other word from the input string


(These define the implcit requirements of the problem)
- Questions:
  - what do we mean by every other word?
  - how do we define a word in this context?
    - words are delimited by spaces


### SECOND EXAMPLE
Imagine a sequence of consecutive even integers begining at 2.
The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third three integers, etc. Given an integer representing the number of a particular row, return an integer representing the sum of all integers in that row.

##### What we know about the problem
- Sequence of integers
- Sequence begins with two
- Integers are consecutive
- Sequence is grouped into rows
- Each row is incrementally larger 1,2,3,4...
- Row 'number' equals the number of elements in the row
  - Row 1 has 1 element, row 2 has 2 integers, etc

- Input: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers
- Output: a single integer
  - The sum of the integers in the row indentified the input integer

- Sequence:
```
2,4,6,8,10,12,14,16,18,...
# becomes...

      2
    4  6
  8 10  12
14  16  18  20
```
- How do we create the structure?