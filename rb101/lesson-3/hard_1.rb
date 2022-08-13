# E1 What do you expect to happen when the `greeting` variable is referenced
# in the last line of the code bellow

if false
  greeting = "hello world"
end

greeting

# SOLUTION 
# when a local variable is intialized inside an `if` statement, the variable
# gets initialized to nil even if the block doesnt get executed
# TODO come back to this, is an if statement a block or not? Why does the variable get initialized to nil???

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
  one = two # "two"
  two = three # "three"
  three = one # one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# SOLUTION

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
