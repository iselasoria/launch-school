=begin
The following code is flawed. It currently allows @name to be modified from
outside the method via a destructive method call. Fix the code so that it
returns a copy of @name instead of a reference to it.

=end

class Person
  # attr_reader :name removing this since we are customizing the getter with a clone

  def initialize(name)
    @name = name
  end

  def name
    @name.clone
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name


# expected:
# James