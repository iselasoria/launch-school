# E1 Use the each method of Array to iterate over 
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.
arre = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arre.each do |item|
  puts item
end

# E2 Same as above, but only print out values greater than 5.
arre = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
larger = []
larger = arre.select do |item|
  if item > 5
    larger << item
  end
end

print larger

# E3 Now, using the same array from #2, use the select method to extract all odd numbers into a new array.
larger = [6, 7, 8, 9, 10]

odds = larger.select do |item|
         if item % 2 != 0
           item
         end
       end

print odds

# E4 Append 11 to the end of the original array. Prepend 0 to the beginning.
arre = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arre.push(11)
p arre

arre.unshift(0)
p arre
#E5 Get rid of 11. And append a 3.
arre = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

p arre.delete(arre.last)
arre << 3
p arre

# E6 Get rid of duplicates without specifically removing any one value.
arre = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 3]
p arre.uniq!

# E7 What's the major difference between an Array and a Hash?
# arrays are ordered collections that relie on numeri indexes to retrieve their values. Hashes are key/value pairs that have no order

# E8 Create a Hash, with one key-value pair, using both Ruby syntax styles.
hashy1 = {name: "rosa" }
hashy2 = {:name => "rosa"}

# E9 Suppose you have a hash h = {a:1, b:2, c:3, d:4}
# a) Get the value of key `:b`.

# b) Add to this hash the key:value pair `{e:5}`

# c) Remove all key:value pairs whose value is less than 3.5

# E10 Can hash values be arrays? Can you have an array of hashes? (give examples)
