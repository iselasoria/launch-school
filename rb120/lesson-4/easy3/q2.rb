# In the last question we had the following classes:
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi # we use keyword self to define a class method
    greeting = Greeting.new # we have to instantiate a new Greetings object because greet imethhod is only available to the ojects of Greeting class not to the class itself
    greeting.greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

p Hello.hi

# If we call Hello.hi we get an error message. How would you fix this?