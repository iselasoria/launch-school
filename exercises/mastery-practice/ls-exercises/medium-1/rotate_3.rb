=begin 
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

I: integer 
O: integer

Goal: 



Examples:
rot 1 = 735291
        |_____^
rot 2 = 352917
        _
         |____^
rot 3 = 329175
        --
          |___^
rot 4 = 321759
        __
          |___^
        321597
        ____
           |__^
rot 5 = 321579

Data:
arrays 

Algorithm:
- iterate over the digits in the input number 
- initialize the max_swaps to arr.size - 2, we need at least the last two to rotate 

- with each iteration
  - initialize a variable called `temp_rotation`
  - if 
=end 


def rotate_array(arr)
  new_arr = []

  arr.each_with_index do |item, idx|
    next if idx == 0
    new_arr << item 
  end
  new_arr << arr[0]
end

def rotate_rightmost_digits(num, rotations)
  numeros = num.digits.reverse
  mini_arr = numeros[-rotations..-1]
  concatenated_nums = numeros[0...-rotations].join + rotate_array(mini_arr).join
  concatenated_nums.to_i
end

def max_rotation(num)
  numeros = num.digits.reverse 

  numeros.each_index do |idx|
    p idx 
    p rotate_rightmost_digits(num, -idx)
  end
end

# def max_rotation(num)
#   numeros = num.digits.reverse
#   index = 0

#   while index <= numeros.size - 2
#     nums_to_rotate = numeros[index..-1]
#     # p nums_to_rotate
#     puts "We hold these in place: #{nums_to_rotate[0...index]}"
#     puts "We need to rotate #{nums_to_rotate}"
#     puts "After rotation: #{rotate_array(nums_to_rotate)}"
#     puts "New: #{(nums_to_rotate[0...index] + rotate_array(nums_to_rotate)).join}"
#     puts " "

#     index += 1
#   end
# end

# p rotate_rightmost_digits(735291, 3) == 735912

# test cases 
p max_rotation(735291)
p max_rotation(735291)# == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845