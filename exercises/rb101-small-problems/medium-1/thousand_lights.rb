=begin
-----------------------INSTRUCTIONS--------------------------------------
You have a bank of switches before you, numbered 1 to `n`. Each switch is connected to exactly one light that is initially off.
You walk by the row of switches and toggle every one of them on. You go back to the beginning, and on this second pass, you
toggle switches 2,4,6, and so on. On the third pass, you go back again to the beginning and toggle switches 3,6,9 and so on.
You repeat this process and keep going until you have been through `n` repetitions.

Write a method that takes one argument, the total number of switches, and returns an aray that identifies which
lights are on after `n` repetitions.

--------------------------PROBLEM----------------------------------------
Questions:
Input: integer
Output: array of integers
---------------------------RULES-----------------------------------------
Explicit: 
- with each pass, the multiples of the current itration get toggled
Implicit: 
- the ones that are not multiples do not get changed
--------------------------EXAMPLES---------------------------------------
      |   1   |   2   |   3   |   4   |   5   |
      +-------+-------+-------+-------+-------+
Rep 1 |   *   |   *   |   *   |   *   |   *   |
Rep 2 |   *   |       |   *   |       |   *   |
Rep 3 |   *   |       |       |       |   *   |
Rep 4 |   *   |       |       |   *   |   *   |
Rep 5 |   *   |       |       |   *   |       |

result = [1,4] are the only lights that are on at the end of `n` repetitions.

----------------------------ALGO----------------------------------------
- initialize an array that ranges from 1 to n
- map an array to [true, true, true, true, true]
- initialize a counter
- iterate over the array
  - if the element in the current iteration is a multiple of the counter
    - toggle
      - array at the current index changes to the opposite
=end

def is_multiple(num, check)
  num % check == 0 ? true : false
end

def toggle(n)
  numerical_arr = (1..n).to_a
  p numerical_arr
  truth_arr = 1.upto(n).map { |item| false } # set up the lights, first they're off

  truth_arr.each_with_index

end 


toggle(5)


# def toggle(n)
#   truth_arr = 1.upto(n).map { |item| false } # 
#   # puts truth_arr
#   # result = []
#   # truth_arr.each_with_index do |light, idx|
#   #   if idx > 0
#   #     p "#{idx} entering the conditions"
#   #     # result = truth_arr.map! do |tog|
#   #     #           if initial_arr[idx] % idx == 0
#   #     #             p tog
#   #     #           end
#   #     #         end
#   #   else 
#   #     p !light # turns on the very first light
#   #   end
#   # end
#   truth_arr
# end 





# def toggle(n)
#   numerical_arr = (1..n).to_a
#   p numerical_arr
#   truth_arr = 1.upto(n).map { |item| false } # set up the lights, first they're off


#   counter = 0

#   while counter < numerical_arr.size
#     # p numerical_arr[counter]
#     # p counter + 1
#     p "Is #{numerical_arr[counter]} a multiple of #{numerical_arr[counter+1]}"
#     if is_multiple(numerical_arr[counter], counter +2 )
#        truth_arr.map! {|check| !check }
      
#     end
#     counter += 1
#   end
# # p truth_arr
# p counter
# end 
