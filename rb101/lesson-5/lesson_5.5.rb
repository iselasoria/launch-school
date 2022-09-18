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

 new_arr = arr.map do |tiny_arr|
              tiny_arr.select do |item|
                item % 3 == 0
              end
            end
p new_arr

# using reject
new_arr = arr.map do |tiny_arr|
  tiny_arr.select do |item|
    item % 3 == 0
  end
end