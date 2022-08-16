=begin
Build a program that randomly generates and prints Teddy's age. 
To get the age, you should generate a random number 
between 20 and 200.
=end

def age()
  age = rand(20..200)
  print "Teddy is #{age} years old!"
end

age()