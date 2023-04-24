class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky

# What is output and why? How could we output a message of our choice instead?

# todo

=begin
the code outputs an instance of the Dog class but without any attributes.
We need to remove the self that was appended and instead create instance
variables to hold the state of the object.
We also need to use the p method to inspect the isntance of the object,
instead of using the puts, as this will call to_s and we don't have a
method defined for this GoodDog class, so we'd have to use the default
implementation of the BasicObject#to_s which would only return the
class name and the object_id encoding.
=end

# How is the output above different than the output of the code below, and why?

class GooderDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    @name = n
    @age  = a * DOG_YEARS
  end
end

spunky = GooderDog.new("Sparky", 4)
p spunky

# this second snippet of code is setting ivars correctly and therefore
# it is working as we expected the first snippet to work. This second
# part is basically the answer to the first.