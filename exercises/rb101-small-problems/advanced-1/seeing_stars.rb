=begin
Write a method that displays an 8-pointed star in an nxn grid,
where n is an odd integer that is supplied as an argument to the method.
The smallest such star you need to handle is a 7x7 grid.


input: integer 
output: a series of strings

Goal: use the input integer as the size of the grid

-----------------------E
Model Solution:
when input is 7 the grid looks like this:
  |||||||
  |||||||
  |||||||
  |||||||
  |||||||
  |||||||
  |||||||
             limit is 7 on all of them
  *||*||* star space space star space space star ----> space: 4 star: 3
  |*|*|*| space star space star space star space ----> space: 4 star: 3
  ||***|| space space star star star space space ----> space: 4 star: 3
  ******* star  star  star star star star  star  ----> space: 0 star: 7
  ||***|| space space star star star space space ----> space: 4 star: 3
  |*|*|*| space star space star space star space ----> space: 4 star: 3
  *||*||* star space space star space space star ----> space: 4 star: 3


=end 
# todo come back to this after algo

# test cases
star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *