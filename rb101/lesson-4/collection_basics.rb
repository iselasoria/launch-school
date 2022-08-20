# E1 Strings
# reference "grass" in the following string:
str = 'The grass is green'
# SOLUTION
p str[4,5] 
#or
p str.slice(4,5)

# E2 Arrays
# what do you think is returned here:

arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2, 3]
arr[2, 3][0]

# SOLUTION
arr[2, 3] # ["c","d","e"]
arr[2, 3][0] #["c"]

# E3 Hashes
# In a hash, the keys must be unique.
# What happens in the code below?
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }

# SOLUTION
# in a hash, like in the example above, if a key is repeated, the last use of that key 
# overwirtes the previous values, so the key `fruit` will have the value `pear`

# E4 What happens in this code?
str = 'ghijk'
arr = ['g', 'h', 'i', 'j', 'k']

# SOLUTION
str[-6] # nil
arr[-6] # nil

# #5 How can the items in the array be joined so they resemble the original string?
str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"
# SOLUTION
p arr.join(' ')