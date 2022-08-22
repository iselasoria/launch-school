# MOdify the following so it iterates 5 times instead of just 1.

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end