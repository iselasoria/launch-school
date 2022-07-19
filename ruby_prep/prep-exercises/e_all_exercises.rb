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
h = {a:1, b:2, c:3, d:4}
p h[:b]

# b) Add to this hash the key:value pair `{e:5}`
h = {a:1, b:2, c:3, d:4}
h[:e] = 5
p h 
# c) Remove all key:value pairs whose value is less than 3.5
h = {a:1, b:2, c:3, d:4}
h.delete_if { |k, v| v < 3.5 }
p h
# E10 Can hash values be arrays? Can you have an array of hashes? (give examples)
# Yes, hash values can be arrays. 
# You can have an array of hahes. 
ex1 = {name: ["rosa","isela"]}
p ex1

ex2 = [{name: "rosa", surname:"soria"}]
p ex2

# E11 Given the following data structures, write a program that copies the information
# from the array into the empty hash that applies to the correct person.

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }
contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]

p contacts

# E12 Using the hash you created from the previous exercise, demonstrate how you would
# access Joe's email and Sally's phone number.

p contacts["Sally Johnson"][:phone]
p contacts["Joe Smith"][:email]

# E13 use delete_if? and start_with? to delete all the stirngs that start with s

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if {|item| item.start_with?("s")}
p arr


arr.delete_if {|item| item.start_with?("s","w")}

p arr

# E14 given the following 
a = ['white snow', 'winter wonderland', 'melting ice','slippery sidewalk', 'salted roads', 'white trees']

new_arre = a.map do |term|
            term.split(" ")
          end
p new_arre.flatten


# E15 what will the following output:
hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end
# this outputs true beacause hashes have no order