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