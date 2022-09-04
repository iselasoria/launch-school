# E1 Give the array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the positions in the array.
# expected: {"Fred":0, "Barney": 1, "Wilma": 2, "Betty": 3, "Pebbles": 4, "BamBam": 5}

newvar = flintstones.each_with_object({}) do |name, hash|
          hash[name] = flintstones.index(name)
         end

        p newvar

# E2 Add up all the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum = 0
ages.each do |person, age|
  sum += age
end

p sum

# second solution uses inject on the array of ages
ages.values.inject(:+) # => 6174


# E3 In the age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# remove people who are 100 or older

youngsters = ages.select! do |person, age|
              age <= 100
            end
            p youngsters

# second solution:
ages.keep_if { |_, age| age < 100 }


# E4 Pick out the minimum age from the hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

# E5 In the array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# find the index of the first name that starts with "Be"
bename = flintstones.index {|name| name[0, 2]=="Be"}
p bename

# SOLUTION
# this method returns the fist index for which the block returns true. 
# It can also be used without a block, and just an element to search for instead:
a = [:foo, 'bar', 2, 'bar']
a.index('bar') # => 1

# E6 Ammend this array so that the elements are shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

shorty = flintstones.map! do |person|
          person[0,3]
        end

        p shorty

# E7 Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"
# expected: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

letter_count={}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  letter_count[letter] = letter_frequency if letter_frequency > 0
end

p letter_count

# ! Maybe come back to this, it is such a common occurance that shoul become second nature.

# E8 What happens when we iterate an array while iterating over it? What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end


numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "Index: #{index}  current number in the array: #{numbers.inspect}  current number in the iteration: #{number}"
  numbers.shift(1)
end
# SOLUTION
# each uses the index to iterate through the collection. In the first iteration, the element at index 0 is 
# passed to the block and printed, this is integer 1. Immediatelty after that, the first element is removed
# with .shift. So by the time the second iteration comes around, the array looks liek this [2,3,4]. Now, since
# each uses index to iterate in real time, it goes to look for element at index 1, which now is integer 3. Immediately after
# shit looks for the first element in the collection which in this second iteraetion is the integer 2, and deletes it. This is why 
# the output is 1 and 3. The third iteration doesnt even happen because at this point out array looks like this: [3,4] and remember
# each iterates in real time using the index, so by this point we've already itearted over index 0 and 1.


# What would this output?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# print 1, remove 4
# print 2, remove 3

# In this example we start with [1,2,3,4] we output 1, and immediately after remove the last element whic is integer 4. 
# In the second iteration, we now have3 [1,2,3], we output 2 and delete the last element which is now integer 3. 
# In trhe third iterationm, our array is now [1,2], but we've already iterated through elements 0 and 1, and so the iteartions stop.


# E9 Rails has a method called `titleize` which makes the first letter in each word like it would be in a title. Ruby itself does not have
# a method like that. How would you write a titleize implementation to proper case this string?
words = "the flintstones rock"
# expected: words = "The Flintstones Rock"