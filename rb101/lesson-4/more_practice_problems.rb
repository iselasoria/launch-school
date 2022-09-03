# E1 Give the array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys and the values are the positions in the array.
# expected: {"Fred":0, "Barney": 1, "Wilma": 2, "Betty": 3, "Pebbles": 4, "BamBam": 5}

newvar = flintstones.each_with_object({}) do |name, hash|
          hash[name] = flintstones.index(name)
         end

        p newvar