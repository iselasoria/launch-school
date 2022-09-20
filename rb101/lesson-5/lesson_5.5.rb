# E1 How would you order this array of numbers by descending numeric value?
arr = ['10', '11', '9', '7', '8']
# expected result => ['11','10','9','8','7']

res = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p res
#* DONE

# E2 How would you order this array of hashes based on the year of publication for each book from earliest to latest?
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_books = books.sort_by do |book|
                book[:published]
              end

p sorted_books

#* DONE

# E3 For each of these collections, access the letter 'g'

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
# p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# p hsh2[:third].key(0)

#* DONE

#! skipped this number, come back to it
# E4 For each of these collection obhects where teh value 3 occurs, demonstrate how you would change it to 4.
arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}


# E5 Given this nested hash:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# figure out the total age of just the male members of the family
total_male_age = 0
munsters.each do |person|
  person.each do |item|
    if item.size > 1 && item["gender"] == "male"
      total_male_age += item["age"]
    end
  end
end
p total_male_age

#* DONE

# LAUNCH SCHOOL SOLUTION
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444

# E6 Given the hash:
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# print the information like this:
# (Name) is a (age)-year-old (male or female).

munsters.each_pair do |key, value|
    p "#{key} is a #{value['age']}-year-old #{value['gender']}"
end

#* DONE


# E7 Given this code, what would be the final values for a and b?
# ! Review
a = 2
b = [5, 8]
arr = [a, b]
p arr
# [2,[5,8]]


arr[0] += 2 # this updates the array, but it does not update the object referenced by local variable a, since we didnt reference a at all
p arr
#[4,[5,8]]

arr[1][0] -= a # this does change because b is an array and we are modifying that array by accessing its elemenet at index 0
p arr

# E8 Using the `each` method, write some code to output all the vowels from the strings:
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
# expected:
# 'euiooueoeeao'
VOWELS = %w(a e i o u)
vowels_in_values = []

hsh.each do |_, word_group|
  word_group.each do |word|
    word.chars.each do |letter|
      if VOWELS.include?(letter)
        vowels_in_values << letter
      end
    end
  end
end

p vowels_in_values.join

# E9 Given this data structure, return a new array of the same structure but with the sub-arrays
# being ordered (alphabetically or numerically) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

new_arr = arr.map do |item|
            item.sort do |a, b|
              b <=> a
            end
            end
p new_arr


# E10 Given the following data structure, and without modifying the original array, use the 
# map method to return a new array identical in structure to the original but where the value
# of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# p arr.object_id
# expected => [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]

new_arr = arr.map do |hashi|
            hashi.each_with_object({}) do |(key, value), newhash|
              newhash[key] = value + 1
       
            end
          end
p new_arr

# E11 Given the following data structure, use  a combination of methods, including
# either select or reject, to return a new array identical in structure to the original
# but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# using select
 new_arr = arr.map do |tiny_arr|
              tiny_arr.select do |item|
                item % 3 == 0
              end
            end
p new_arr

# using reject
new_arr2 = arr.map do |tiny_arr|
  tiny_arr.reject do |item|
    item % 3 != 0
  end
end

p new_arr2


# E12 Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in each
# subarray and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: 
# {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

new_hash = arr.each_with_object({}) do |item, hashy|
            hashy[item[0]] = item[1]
          end

p new_hash

# E13 Given the following data structure, return a new array containing the same sub-arrays as the original but ordered
# logically by only taking into consideration the off numbers they contain.
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

# expected:
# [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

# ! LAUNCH SCHOOL SOLUTION. Come back to this!

arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
# => [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

# E14 Given this data structure, write some code to return an array containing the colors of the fruits and the sizes of the vegetables. 
# The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
# expected: 
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

new_array = hsh.map do |_, value|
              if value[:type] == 'fruit'
                value[:colors].map do |color|
                  color.capitalize
                end
              elsif value[:type] == 'vegetable'
                value[:size].upcase
              end
            end
p new_array

# E15 Given this data structure, write some code to return an array which contains only the hashes where all the integers are even.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# [
#   {a: [1, 2, 3]},
#   {b: [2, 4, 6], c: [3, 6], d: [4]}, 
#   {e: [8], f: [6, 10]}
# ]


new_collection = arr.map do |hashy|
                    # p hashy.values
                    hashy.values.select do |tiny_arr| 
                      tiny_arr.all? do |item|
                        p item.even?
                      end

                    end
                  end 

p new_collection

# ! Come back to this. Why isn't it [[], [[2, 4, 6], [4]], [[8], [6, 10]]]

# E16 Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
# "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
# Write a method that returns one UUID when called with no parameters.

# algorithm
# 8-4-4-4-12
# - generate a starting 8-character chunk
  # - initalize an emtpy array to hold the chunk
  # - set variable to hold alphabet
  # - set variable to hold 0-9
  # - sample either alphabet or numbers randomly
# - generate four middle 4-character chunks
  # - initalize an emtpy array to hold the chunk
  # - set variable to hold alphabet
  # - set variable to hold 0-9
  # - sample either alphabet or numbers randomly
# - generate the last 12-character chunk
  # - initalize an emtpy array to hold the chunk
  # - set variable to hold alphabet
  # - set variable to hold 0-9
  # - sample either alphabet or numbers randomly
def randomify()
  randomizer_digit = rand(0...100)
  if randomizer_digit % 3 == 0
    1
  else
    2
  end
end

def eight_chunk()
  chunk = []
  alpha = ('a'..'z').to_a
  numeric  = (0..9).to_a

  while chunk.size < 8
    alpha_sample = alpha.sample
    numeric_sample = numeric.sample
    
    if randomify.even?
      chunk << alpha_sample
    else 
      chunk << numeric_sample
    end
  end
  chunk
end


def four_chunk()
  chunk = []
  alpha = ('a'..'z').to_a
  numeric  = (0..9).to_a

  while chunk.size < 4
    alpha_sample = alpha.sample
    numeric_sample = numeric.sample
    
    if randomify.even?
      chunk << alpha_sample
    else 
      chunk << numeric_sample
    end
  end
  chunk
end

def twelve_chunk()
  chunk = []
  alpha = ('a'..'z').to_a
  numeric  = (0..9).to_a

  while chunk.size < 12
    alpha_sample = alpha.sample
    numeric_sample = numeric.sample
    
    if randomify.even?
      chunk << alpha_sample
    else 
      chunk << numeric_sample
    end
  end
  chunk
end

def uuid()
  uuid_collection = []
  
  uuid_collection << eight_chunk.join << four_chunk.join << four_chunk.join << four_chunk.join << four_chunk.join  << twelve_chunk.join

  uuid_clean = uuid_collection.map do |mod|
                mod + '-'
              end
  uuid_clean = uuid_clean.join[0, 41] # this gets rid of the trailing '-'
end

p uuid()