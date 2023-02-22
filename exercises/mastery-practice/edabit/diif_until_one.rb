=begin 

Write a function that transforms an array into an array of its differences repeatedly until there exists only one element left. A difference is A[n+1] - A[n].

To illustrate:

INPUT: [5, 1, 9, 3, 4, 0]

       [-4, 8, -6, 1, -4]
# 1 - 5 = -4; 9 - 1 = 8; 3 - 9 = -6; etc.

[12, -14, 7, -5]

[-26, 21, -12]

[47, -33]

-80
EXAMPLES:
n_differences([5, 1, 9, 3, 4, 0]) ➞ -80
n_differences([1, 1, 1, 1]) ➞ 0
n_differences([5, 8, 8]) ➞ -3


I: array of integers 
O: integer 

Goal: take the difference of next item in the array minus current item in the array and keep going until a single element is left 

Rules:
- diff = next_item - current_item 
- array to check is getting constantly reduced down by 1 element until only one is left 

Examples:
input_arr = [5, 1, 9, 3, 4, 0]
subtract:    (1-5)(9-1)(3-9)(4-3)(0-4)
checker_arr:  -4   8    -6    1   -4 --> now run subtractions through this array 
            [-4, 8, -6,1,-4]
subtract    (8--4)(-6-8)(1--6)(-4-1)
checker_arr:  12     -14   7     -5
              [12,-14,7,-5]
subtract:     (-14-12)(7--14)(-5-7)
checker_arr:    -26     21    -12
              [-26, 21,-12]
              (21--26)(-12-21)
              47        -33
              [47, -33]
              (-33-47)
               -70

Data Structures:
I: array 
Interim: array 
O: integer 

Algorithm:

- make a copy of the input array and store as `checker_arr` # [5, 1, 9, 3, 4, 0]
                                                              [5, 1, 9, 3, 4]
- temp_check = [] # [-4, 8, -6,1,-4]

- this happens in a loop until we reach a single element array 
  - iterate over checker_arr from index 0 to penultimate #[5, 1, 9, 3, 4]
    - initialize `diff` as next item - current item # 1-5, 9-1, etc...
    - push diff into temp_check

  - reassign checker_arr to temp_check

=end 
=begin 
6 5 4 3 2 1 --> factorial!

=end

def n_differences(arr)
  checker_arr = arr.dup 



  while checker_arr.size > 1
    temp_check = []
    checker_arr[0...-1].each_with_index do |num, idx|
      diff = checker_arr[idx + 1] - num ## check range 
 
      temp_check << diff 

    end
    checker_arr = temp_check

 
  end
  checker_arr[0]
end 



# def n_differences(arr)
#   loop do
#     break if arr.size == 1
#     couples = []
#     arr.each_cons(2){|pair| couples << pair}
#     arr = couples.map{|couple| couple[1] - couple[0]}
#   end

#   arr[0]
# end
# test cases 

p n_differences([5, 1, 9, 3, 4, 0]) == -80
p n_differences([8, 9, 2, 5, 4, 3, 3, 1, 6]) == -94
p n_differences([5, 1, 9, 6, 1, 7, 3, 4]) == 118
p n_differences([1, 1, 1, 1]) == 0
p n_differences([5, 9, 7, 3]) == 4
p n_differences([1, 5, 3, 9, 7]) == -30
p n_differences([5, 8, 8]) == -3
p n_differences([4, 0, 0, 0, 1])  === 5
p n_differences([3, 5]) == 2