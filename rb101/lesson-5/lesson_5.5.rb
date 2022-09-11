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
