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

# E5 How can the items in the array be joined so they resemble the original string?
str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"
# SOLUTION
p arr.join(' ')

# E6 What do you think will happen when `to_h` is called on this array?
arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]

arr.to_h # => {name: 'Joe', age: 10, favorite_color: 'blue'}

# E7 Give this example, how would you change the first letter of each word to its capital equivalent?

str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"

str[6] = 'F'
str[15] = 'C'
str[21] = 'I'
str[24] = 'B'
str # => "Joe's Favorite Color Is Blue"

# E8 Given this code, modify each element to increse by 1
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]

arr[1] += 1
arr[2] += 1
arr[3] += 1
arr[4] += 1
arr # => [2, 3, 4, 5, 6]