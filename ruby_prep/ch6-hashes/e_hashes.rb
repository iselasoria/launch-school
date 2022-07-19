# E1 Given a hash of family members, with keys as the title and an array of names as the values,
# use Ruby's built-in select method to gather only immediate family members' names into a new array.

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

immediate = family.select do |key, value|
              key == :sisters || key == :brothers
            end
arr = immediate.values.flatten

p arr

# E2 Look at Ruby's merge method. Notice that it has two versions. What is the difference
# between merge and merge!? Write a program that uses both and illustrate the differences.

hashy1 = {age: 31}

hashy2 = {name: "rosa isela", lastname: "soria monzon"}

p hashy1.merge(hashy2)
p hashy1
p hashy2
puts 
p hashy1.merge!(hashy2)
p hashy1
p hashy2

# merge is non-destructive, it does not mutate the caller. merge! does mutate the caller-- notice how hashy2 remains the same
# merge! mutates the _caller_

# E3 Using some of Ruby's built-in Hash methods, write a program that loops through a hash and 
# prints all of the keys. Then write a program that does the same thing except printing the values.
# Finally, write a program that prints both.


hashy = {name: "rosa isela", lastname: "soria monzon"}

# print keys
hashy.each_key do |k|
  puts k
end

# print values
hashy.each_value do |v|
  puts v
end

# print both key and value
hashy.each do |k,v|
  puts "#{k} #{v}"
end

# E4 How would you access the name of the person?
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

p person[:name]

# E5 What method could you use to find out if a Hash contains a specific value in it?
# Write a program that verifies that the value is within the hash.

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

p person.value?("Bob")

# E6 Given the code bellow, what is the difference between the two hashes ceated:
x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

# first one uses a symbol as key, the second one uses the string value of x as the key

# E7 If you see this error, what is most likely the problem?
NoMethodError: undefined method `keys' for Array

# error when attempting to use a method that is not available in the class. In this example, trying to use "keys" for
# the Array class, arrays do not have keys, they have indexes