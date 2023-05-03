class Person
  TITLES = ['Mr', 'Mrs', 'Ms', 'Dr']

  @@total_people = 0

  def initialize(name)
    @name = name
  end

  def age
    @age
  end
end

# What are the scopes of each of the different variables in the above code?
# S:
# constants are scoped lexically
# @age is an unititialzied ivar is not yet scoped to an object
# @name is scoped to the instance
# @@total_people is a class variable and is available to all instance of the class adn the instances of subclasses