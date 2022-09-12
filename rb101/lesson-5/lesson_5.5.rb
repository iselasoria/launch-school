# E1 How would you order this array of numbers by descending numeric value?
arr = ['10', '11', '9', '7', '8']
# expected result => ['11','10','9','8','7']

res = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p res

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


# E7 Given this code, what would be the final values for a and b?
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