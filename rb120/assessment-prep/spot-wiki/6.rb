class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def change_name
    self.name = name.upcase
  end
end

bob = Person.new('Bob')
p bob.name
bob.change_name
p bob.name


# In the code above, we hope to output `'BOB'` on `line 16`.
# Instead, we raise an error. Why? How could we adjust this code to output `'BOB'`?
# S:
# the code as it was raised an error because `name` was a local variable, NOT the setter method.
# In order to make use of the setter method by that name, we have to use the keyword `self` prepended
# to the method name, that way Ruby knows to call the setter method name on the object.