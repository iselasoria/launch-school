# E1 What do you expect to happen when the `greeting` variable is referenced
# in the last line of the code bellow

if false
  greeting = "hello world"
end

greeting

# SOLUTION 
# when a local variable is intialized inside an `if` statement, the variable
# gets initialized to nil even if the block doesnt get executed
# ! solved--> Pete confirmed if does _not_ create a block.

# E2 what is the result of the last line of code?
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # {a: 'hi there'}
# SOLUTION 
# the new local variable `informal_greeting` is refencing the original object "hi"
# because we use `<<` to add ' there', and `infromal_greeting` was refencing the 
# original object, we have no changed the original object too

# E3 What is outputted by each of the three code snippets below?
# SNIPPET A
def mess_with_vars(one, two, three)
  one = two # "one"
  two = three # "two"
  three = one # "three"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# SOLUTION
# "one"
# "two"
# "three"

# SNIPPET B
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# SOLUTION
# "one"
# "two"
# "three"

# SNIPPET C
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# SOLUTION
# "two"
# "three"
# "one"

# E4 Fix this code so that it identifies valid IP addresses like 10.4.5.11
# items like these should be invalid: "4.5.5" or "1.2.3.4.5"
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# SOLUTION
# check that the length is 4 items. Breaking out of the loop was just falling
# through to the return true outside of the loop, so this was a bug too so we
# can fix by using return false insteaf of break.
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end