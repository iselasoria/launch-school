=begin
The following code prompts the user to set their own password if they haven't done so already, and then prompts them to login with that password.
However, the program throws an error. What is the problem and how can you fix it?

Once you get the program to run without error, does it behave as expected? Verify that you are able to log in with your new password.
=end

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
  new_password # needs to be the return
end


def verify_password(password) # needs to be accessed as a param
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)

# The bug was in that the set_password method was not returning the newsly set password. 
# the second problem was that the verify_password method was not able to access the password variable, it needed to have access granted via a parameter.