# def sum_even_number_row(row_number)

# end

def create_row(start_integer, row_length)
  row = []
  # steps 2-4
  row
end

# test cases
# p sum_even_number_row(1) == 2 # true
# p sum_even_number_row(2) == 10
# p sum_even_number_row(4) == 68

p create_row(2, 1)
p create_row(2, 1) == [2] # true
p create_row(4, 2) == [4,6]
p create_row(8, 3) == [8, 10, 12]

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