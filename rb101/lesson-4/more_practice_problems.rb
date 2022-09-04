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

# E8

# E9