class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal

  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")

puts teddy.dog_name


# What is output and why?
=begin
The reason we can't see the "Teddy" string in the sentence output by the code above is that the initialzie that overrides the superclass constructor is not doing anything with the
argument that it takes in, that only happens in the superclass initialize and we never get to use it.
=end

# talk more about how the ivar doesnt even exits t