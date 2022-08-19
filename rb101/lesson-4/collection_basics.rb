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