# if we have this code:
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# Explain what happens in each of the following cases:
# case 1
hello = Hello.new
hello.hi
# Hello gets output this is because Hello gets passed in to hi instance methof from the Hello class

# case 2
hello = Hello.new
hello.bye 
# this throws an error becasue neither the calling object nor its superclass have a bye instance method defined

# case 3
hello = Hello.new
hello.greet 
# this will throw an error because it calls the gree method directlty from the Greeting class 
# but doesn't supply an argument as the instance method expects, so it will complain about that

# case 4
hello = Hello.new
hello.greet("Goodbye")
# this calls the greet directly from the Greeting class, so it will output "Goodbye"
# since that is the argument that was provided 

# case 5
Hello.hi
# this will throw and error because it is attempting to call instance method hi on the class as if it were
# a class method and we can't do that

