# Modify the following code so that Hello! I'm a cat! is printed 
# when Cat.generic_greeting is invoked.

class Cat
  
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting # since the method is being called on the class Cat, this
# tells us it's a class method. We use self to define those in this case 

# expected
# Hello! I'm a cat!
kitty = Cat.new

kitty.class.generic_greeting # <---- this actually works because since kitty.class returns class Cat, and then we chain on 
                             #  the .generic_greeting method, which is called on a class