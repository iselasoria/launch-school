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

# E4 Given this nested hash:
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

# E5 Given the hash:
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
