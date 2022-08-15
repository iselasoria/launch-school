# write a method that takes two arguments, a string and a 
# positive integer, and prints the string as many times
# as the string indicates

# example: repeat('Hello', 3)
# output:
# Hello
# Hello
# Hello

def repeat(stringy, repeat)
  repeat.times do |item|
    puts stringy
  end
end

repeat("Hello",3)