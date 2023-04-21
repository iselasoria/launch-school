
class Cat
  def initialize(name)
    @name = name
  end

  def what_am_i?
    self
  end
end

class Persian < Cat; end

fluffy = Persian.new('Fluffy')
p fluffy.what_am_i? # what is output?

=begin
Maybe these concepts are too unrelated for me to mentally group them but that discussion with the inheritance behaviour around `self` made me think of the way constants get resolved based on where they are defined. In the example Justin worked on during the session, the response to `what_am_i?` instance method getting called was at first a Cat object, and after inheritance, a Persian object inheriting from Cat superclass. The `what_am_i?` method was not overriden in the subclass Persian and it just went up the inheritance chain and searched for a method to resolve it and found it in Cat class while _still_ retaining the knowledge that the instance that called it was a Persian object.

This differs from the behaviour I see here:
=end

class Cat
  TYPE = 'Long Hair'

  def initialize(name)
    @name = name
  end

  def what_am_i?
    self
  end

  def hair_type
    # self.class::TYPE
    TYPE
  end
end

class Persian < Cat
  TYPE = "Short Hair"
  # def hair_type
  #   TYPE
  # end
end

fluffy = Persian.new('Fluffy')
p fluffy.what_am_i? # what is output?
p fluffy.hair_type

=begin
In that code, we have a constant `TYPE` in the superclass, the constant is defined differently (can we say overriden?) by the Persian class. We then call `hair_type` on an instance of the Persian class but because we did not override the method, we see that the constant call happens in Cat and gets resolved there, without knowledge that the object calling it was originally a Persian. If we did uncomment the hair_type method definition in the Persian class, we'd be able to see the constant that we defined there.

One way to "fix" this without overriding the method, is to

=end


