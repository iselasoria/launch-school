=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a methid that takes a grocery list(array) of fruits and quantities
and converts it into an array of the correct number of each fruit.
--------------------------PROBLEM----------------------------------------
Questions:
Input: array
Output: array
---------------------------RULES-----------------------------------------
Explicit: 
- take a nested array with the number of fruits of each kind
- each sub-array contains [fruit, #]
Implicit: 

--------------------------EXAMPLES---------------------------------------
['apples', 3] --> ['apple','apple','apple']
----------------------------ALGO----------------------------------------

- read outer array --> ['apple', 3]
  - read inner array --> apple
                             3
  - for each iteration of the inner array, multiply the arr[1] * arr[0]

=end

def buy_fruit(list)
  extracted_qt = []
  list.each do |item|
    fruit, qt = item[0], item[1]
      qt.times { extracted_qt << fruit }
  end
  extracted_qt
end


# def buy_fruit(list)
#   extracted_qt = []
#   list.map do |item|
#     item.map do |fruit|
#       if fruit.to_i.to_s != '0'
#         extracted_qt << fruit
#       end
#       p extracted_qt
#       # extracted_qt.inject {|prod, num| prod * num}
#     end
#   end
# end


# test case
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==["apples", "apples", "apples", "orange", "bananas","bananas"]

# * DONE but review