# Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}." # instead of mutating the object, we just upcase it in this one location
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# What output does this code print? Fix this class so that there are no 
# surprises waiting in store for the unsuspecting developer.
# one reason to not mutate in the place that we do it in the code above is calling `to_s`
# and having it mutate an object is most than likely an unintentional change, mutating is allowed
# but we should be explicit about where we do it