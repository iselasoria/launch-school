=begin
Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. 
The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, 
and the other end at the upper-right.


Input: integer 
Ourtput: string that forms a triangle

Rules:
- n is the height of the triangle
- n is the longest horizontal side of the triangle
- stars increase with each line
- space decreases with each line 

Examples:
triangle(5)

    *
   **
  ***
 ****
*****
triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

Data Structures:
 arrays 

Algorithm:
- initialize a stars and a spaces
  - stars starts at 1
  - spaces starts at n - 1

- iterate n number of times 
  - with each run,
    - print spaces + stars
    - decrease stars adn incerase spaces 

=end

def triangle(n)
  stars = 1
  spaces = n - 1

  (1..n).each do |run|
    puts (' ' * spaces) + ('*' * stars)
    stars += 1
    spaces -= 1 
  end
end


p triangle(5)

# * DONE 4m15s