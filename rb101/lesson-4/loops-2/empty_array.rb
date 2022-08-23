# given the array below, use `loop` to remove and print each name from first to last.
#  Stop the loop once names doesnt contains any more elements.
# Keep in mind, you must use loop not while, until etc.

names = ['Sally', 'Joe', 'Lisa', 'Henry']

p names

counter = 0
loop do
  names.shift(1)
  counter += 1
  break if names.size == 0
end


p names

# CLEANER SOLUTION
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift
  break if names.empty?
end