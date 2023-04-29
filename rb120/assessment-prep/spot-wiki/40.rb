module Flight
  def fly; end
end

module Aquatic
  def swim; end
end

module Migratory
  def migrate; end
end

class Animal
end

class Bird < Animal
end

class Penguin < Bird
  include Aquatic
  include Migratory
end

pingu = Penguin.new
p pingu.class.ancestors
# pingu.fly


# What is the method lookup path that Ruby will use as a result of the call to the `fly` method? Explain how we can verify this.

# The method lookup path is the order in which Ruby traverses the class hierarchy looking for methods to invoke. It searching within the object's class, any included modules (last to first), the parent classes and included modules.

# We can verify the method lookup path by invoking the `ancestors` method on the class. `ancestors` returns an ordered array of the classes and modules found in the method lookup path.

# Penguin class-> the enclosing structure, Modules (last to first) -> Migratory -> Aquatic, Bird, Animal, Object, Kernel, BasicObject