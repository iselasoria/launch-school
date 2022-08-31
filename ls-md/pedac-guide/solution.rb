def sum_even_number_row(row_number)
  rows = []
  start_integer = 2

  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end

  # rows.last.reduce { |final_row_sum, num| final_row_sum + num } # this would work too!
  rows.last.sum
  
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  # steps 2-4
  loop do 
    row << current_integer
    current_integer +=2 
    break if row.length == row_length
  end
  row
end

# calculating the start_integer:
# Rule: first integer of row == last integer of the preceding row + 2
# Algorithm:
#   -Get the last row of the rows array
#   -Get last integer of that row
#   -Add add 2


# test cases
p sum_even_number_row(1) == 2 # true
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68

# p create_row(2, 1)
# p create_row(2, 1) == [2] # true
# p create_row(4, 2) == [4,6]
# p create_row(8, 3) == [8, 10, 12]

# # algo
# 1. Create an empty 'row' array to contains the integers
# 2. Add the starting integer
# 3. Increment stating integert by 2 to get the next integer in the sequence
# 4. Repeat steps 2 and 3 unitl the wrray has reached the correct length
# 5. return the 'row' array

# Start the loop
#   - Add the start integer to the row
#   - Increment the start integer by 2
#   - Break out of the loop if length of row == row length

## Final Thoughts
# Don't approach PEDAC as a linear process, be willing to go back and forth
# Switch from implementation to back to problem solving mode when necessary
# Don't try to problem-solve at the code-level