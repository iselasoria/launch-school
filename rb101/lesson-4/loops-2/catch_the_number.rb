# Modify the following so that the loop stops if the number is equat to or between 0 and 10

loop do
  number = rand(100)
  puts number
  break if number == 0 || number == 10 || (number > 0 && number < 10)
end

# Secondary solution
loop do
  number = rand(100)
  puts number

  if number.between?(0, 10)
    break
  end
end