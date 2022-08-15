=begin
wirte a method that counts the number of occurences
of each elemennt in a given array
=end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]


def count_occurrences(arre)
  counter = {}
  arre.each do |item|
    counter[item] = arre.count(item)
  end

  counter.each do |item, count|
    puts "#{item} => #{count}"
  end
end
count_occurrences(vehicles)