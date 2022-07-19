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

# E3 How do you return the word "example" from the folling array?
arr = [["test", "hello", "world"],["example", "mem"]]

p arr[1][0] # or 
p arr.last.first

# E4 what does each method return in the following example?
arr = [15, 7, 18, 5, 12, 8, 5, 1]

p arr.index(5) # 3 returns the index of the first element that matches the argument

p arr.index[5] # error

p arr[5] # 8

# E5 What is the value of a, b, and c in the following program?
string = "Welcome to America!"
a = string[6] # e
b = string[11] # A
c = string[19] # nil because the idex is out of bound
p a 
p b 
p c

# E6 This code gives the error mesage below. What's wrong and how can it be fixed? 
names = ['bob', 'joe', 'susan', 'margaret']
names['margaret'] = 'jody'

# TypeError: no implicit conversion of String into Integer
#   from (irb):2:in `[]='
#   from (irb):2
#   from /Users/username/.rvm/rubies/ruby-2.5.3/bin/irb:12:in `<main>'

# # it's using array index notation so you have to use an integer if you want to access the eleemnt in the 
# array, in this case, the index where margaret is would be 3 so names[3]

# E7 Use the `each_with_index` method to iterate through an arraay of your creation that pritns each index and value fo the array

cats = ["Burbus","Clarice","Motita","Nieve","Vainilla"]

cats.each_with_index do |cat, idx|
  puts "#{cat} is at index #{idx}"
end

# E8 Write a program that iterates over an array and builds a new array that is the result of
# incrementing each value in the original array by a value of 2. You should have two arrays at 
# the end of this program, The original array and the new array you've created. Print both arrays 
# to the screen using the p method instead of puts.

arre = [2,4,6,8]

new_arre = arre.map do |item|
              item * 2
           end

p arre
p new_arre