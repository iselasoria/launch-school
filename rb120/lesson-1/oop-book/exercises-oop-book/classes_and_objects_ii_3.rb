# When running the following code:
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

# We get the error bellow, how can we fix it?

# SOLUTION:
# The error lies in the fact that we use a reader instead of a setter method. This makes the code read-only.
# We can fix by giving the class the `attr_accessor` instead of the reader.
test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)


