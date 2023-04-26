class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name
puts bob
puts bob.name


# What is output on `lines 14, 15, and 16` and why?
# Line 14 outputs Bob, as it was passed to the constructor method.
# Line 15, will output "My name is BOB" because we are overriding the to_s method to have it output
# that string and inside the method implementation we are referencing the name getter method and
# callling upcase! on its return. Lastly, on line 16, we output BOB because since we used the
# mutating method in the implementation of to_s, we have permanently altered the string object.