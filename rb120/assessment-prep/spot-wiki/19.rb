# What is the `attr_accessor` method, and why wouldn’t we want to
# just add `attr_accessor` methods for every instance variable
# in our class? Give an example.

# attr_accessor gives us both a getter and a setter method for instance variables.
# The reason we don't want to just spirkle our code with att_accessors is becasue
# we don't want all out isntance variables to be exposed to the public interface and we might want
# to have the reader as a public method but hide the writter. This is a reason why there are
# individual ones.

class GoldenGirls
  attr_reader :age

  def initialize(name, age)
    @name = name
    @age = age
  end
  private
  attr_writer :age
end

blanche = GoldenGirls.new('Blanche', 55)
p blanche.age = 39