require 'pry'
=begin
-----------------------INSTRUCTIONS--------------------------------------
If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining digits,
you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759.
Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, 
keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. 
The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum
rotation of that argument. You can (and probably should) use the
rotate_rightmost_digits method from the previous exercise.
--------------------------PROBLEM----------------------------------------
Questions:
Input: 
- integer
Output: 
- integer
---------------------------RULES-----------------------------------------
Explicit: 
- keep the first digit fixed, rotate the rest
- keep the first two digits fixed, rotate the rest...

Implicit: 
- don't need to handle multiple zeros
--------------------------EXAMPLES---------------------------------------
735291 --> 352917 --> 329175 --> 321759 --> 321597 --> 321579

----------------------------ALGO----------------------------------------
- At counter = 0, call rotation on arr[counter..-1]--> from the start of the counter to the end
- At counter = 1, call the rotation on arr[1..-1]--> second item to the end
- At counter = 2, call the rotation on arr[2..-1]--> third to the end, etc
- this should return with each iteration the newly rotated, to which we have to add the first put in place items

=end

def rotate_array(arre)
  rotated = []
  arre[1..arre.size - 1] << arre.first
end

def rotate_rightmost_digits(cifra, n)
  custom_rotated = []
  list_of_chars = cifra.to_s.chars
  # list_of_chars[-n..-1] # from the n you want to grab, up until the end
  custom_rotated = list_of_chars[0..-n -1]
  custom_rotated << rotate_array(list_of_chars[-n..-1])

  custom_rotated.flatten!.join().to_i
end

def max_rotation(number)
end



# test cases
p max_rotation(735291) #== 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845

# TODO the object returned by the previous method has some weird nesting, the algo should work. See the algo section

# def max_rotation(number)
  #   counter = 0
  #   max_rotation = []
  #   list = number.to_s.chars
  #   while counter < list.size
  #     # binding.pry
  #     max_rotation << halfways_rotation(list[counter..-1], counter).join()
  #     p halfways_rotation(list[counter..-1], counter)
  #     # p list[counter]
  #     # max_rotation << list[counter]
  #     # max_rotation.join()
  #     counter += 1
  #   end
  #   max_rotation
  # end