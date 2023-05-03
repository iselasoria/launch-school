class Cat
  def initialize(name, coloring)
    @name = name
    @coloring = coloring
  end

  def purr; end

  def jump; end

  def sleep; end

  def eat; end
end

max = Cat.new("Max", "tabby")
molly = Cat.new("Molly", "gray")


# Do `molly` and `max` have the same states and behaviors in the code above? Explain why or why not, and what this demonstrates about objects in Ruby.

# A class defines bahaviors that are made accessible to every isntance of that
# class. Objects encapsulate state, so `molly` and `max` will have the same behaviors, as they are objects of the same class. However, they will not
# have the same state because state is individual to objects-- it is encapsulated.