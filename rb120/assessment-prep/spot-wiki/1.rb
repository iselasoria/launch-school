class Person
  attr_reader :name

  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob.name


# What is output and why? What does this demonstrate about instance variables
# that differentiates them from local variables?

=begin
S:
The code will output nil. Contrary to how local variables behave, instance variables have a conception state of nil.
Local variables, if they have not been given a value to point to, meaning they have not been initialized, they will just
raise a NoMethod error. In contrast, with instance variabkes, as soon as the class gets parsed, instance variables are set to nil and this is the state they retain until they are given
an explicit value. In the code above, since the set_name method never gets called on the instance of Person, the code that sets the
name instance variable never gets executed that is why we see nil.

=end