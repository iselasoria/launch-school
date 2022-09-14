# The Array#bsearch is used to search ordered Arrays more quickly than #find or #select.
# Assume you hav3e the following:
a = [1, 4, 8, 11, 15, 19]

# How would you search the array to find the first element whose value exceeds 8?

value = a.bsearch {|x| x > 8}
puts value