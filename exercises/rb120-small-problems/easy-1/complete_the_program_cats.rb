# Consider the following:
class Pet
  
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet

  def initialize(name, age, fur)
    super(name, age) # we need to pass only two args to the superclass constructor-- it only expects 2
    @fur = fur # we add the third instance variable here, overriding the initialize method form the parent class 
  end


  def to_s 
    "My cat #{@name} is #{@age} years old and has #{@fur} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Update the code so it outputs the following:
# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.