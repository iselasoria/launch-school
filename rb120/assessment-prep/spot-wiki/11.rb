class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
    puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end


# What is output and why? How does this code demonstrate polymorphism?
# this code implements polymorphism by inheritance, it provides overriding of the method
# eat for each of the subclasses, allowing them all to responde to the same interface. Furthermore,
# the array containing different objects on line 23, shows the intention of making them all "quack"