# E1 How would you write a method to select the key-value pairs where the value is 'Fruit'?
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# SOLUTION
def select_fruit(hashi)
  hashi.select do |k, v|
    v == 'Fruit'
  end
end



# SOLUTION WITH LOOP
def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end


p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# E2 The method below transforms an array by multiplying each element by 2. The result is a new array.
# How would you implement a double_numbers! array where the original array object is mutated?

def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

# double_numbers!
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end

  numbers
end

# test cases
my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]

# E3 The code below doubles the numbers in the array that are odd.
# How would you implement a method that doubles the number if the position or index in the array is odd?
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

# SOLUTION
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated
p my_numbers                      # => [1, 4, 3, 7, 2, 6]


# E4 This code below is a modification on an earlier method. Now, we can pass a selection criteria 
# along with the collection; this allows for a more generic and therefore more reusable code.
# How would you implement a method that allows you to multiply every element in an array by a specific number?

def general_select(produce_list, selection_criteria)
  produce_keys = produce_list.keys
  counter = 0
  selected_produce = {}

  loop do
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    # used to be current_value == 'Fruit'
    if current_value == selection_criteria
      selected_produce[current_key] = current_value
    end

    counter += 1
  end

  selected_produce
end


# SOLUTION

def general_multiply(arre, operand)
  altered_numbers = []
  counter = 0

  loop do
    break if counter == arre.size
    current_number ==  numbers[counter]
    altered_numbers << current_number * operand
  end
  altered_numbers
end