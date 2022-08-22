# Modify so "Hello!" gets printed 5 times.

say_hello = true

while say_hello
  puts 'Hello!'
  say_hello = false
end

# SOLUTION
say_hello = true
iterations = 0

while say_hello
  puts 'Hello!'
  iterations += 1
  if iterations == 5
    say_hello = false
  end
end