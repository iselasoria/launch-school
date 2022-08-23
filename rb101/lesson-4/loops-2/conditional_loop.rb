=begin 
write an if/else statement that executes some code if the `process_the_loop` variable is true
and some other code when it is false. Specifically:
- when the process_the_loop is true, execute a liip that iterates exactlky once and prints
"the loop was processes" during that iteration.
- when the process_the_loop is false, just print "the loop wasnt processed!"
Use the following code to initialize process_the_llop. It will randomly assign the variable truye or false
=end

process_the_loop = [true, false].sample

loop do 
  if process_the_loop == true
    puts "The loop was processed!"
    break
  else
    puts "The loop wasn't processed!"
  end
end