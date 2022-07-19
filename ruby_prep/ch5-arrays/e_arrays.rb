# E1 Below we have an array and a number. Write a program
# that checks to see if the number appears in the array

arr = [1, 3, 5, 7, 9, 11]
number = 3

p arr.include?(number)

# E2 what will the following programs return, what is the value of arr after each?
1. arr = ["b", "a"]
   arr = arr.product(Array(1..3)) # [["b",1],["b",2],["b",3],["a",1],["a",2],["a",3]]
   arr.first.delete(arr.first.last) # [["b"],["b",2],["b",3],["a",1],["a",2],["a",3]]
  # from the first element in the array, delete the last element in that first array
2. arr = ["b", "a"]
   arr = arr.product([Array(1..3)]) # [[1,2,3]] so the full thing is: 
   ["b",[1,2,3],"a",[[1,2,3]]]
   arr.first.delete(arr.first.last) # [["b"],["a",[1,2,3]]]
# E3
# E4