=begin 
* DONE
 TODO Interview Practice

Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.


Algorithn:
- itreate over the groceriy_list 
  - for each item 
    - transform it into item[0] * item[2]
=end

def buy_fruit(groceriy_list)
  new_arr = []

  groceriy_list.each do |item|
    fruit, qty = item[0], item[1]
    qty.times do |_|
      new_arr << fruit
    end
  end
  new_arr
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) #== ["apples", "apples", "apples", "orange", "bananas","bananas"]