class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = [] # array we're calling jump on
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets.jump


# We raise an error in the code above. Why? What do `kitty` and `bud` represent in relation to our `Person` object?

=begin
The error gets raised because we push the two instances of Pet (Bulldog and Cat) into the
@pets ivar for Person. These two instances are now collaborator objects of the Person object.
But the issue is we then call jump on this array referenced by jump, which we don't have a
definition for in the Array class.


error happens becase of the jump call to array not the begiingm,
=end