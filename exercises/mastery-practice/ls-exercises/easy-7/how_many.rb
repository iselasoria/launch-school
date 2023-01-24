=begin 
* DONE 2m
Write a method that counts the number of occurrences of each element in a given array. Case matters. Print the output.
car => 4
truck => 3
SUV => 1
motorcycle => 2
=end

def count_occurrences(arr)
  tally_up = arr.tally
  tally_up.each do |item|
    puts "#{item[0]} => #{item[1]}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

