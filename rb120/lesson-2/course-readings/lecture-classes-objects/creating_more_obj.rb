=begin 

Using the class definition from step 3, create a few more people-- that is, 
Person objects.

If we're trying to determine whether the two objects contain 
the same name, how can we compare the two objects?


=end 

class Person
  attr_accessor :first_name, :last_name

  
  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first 
    @last_name = parts.size > 1 ? parts.last : ""
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parts = full_name.split 
    self.first_name = parts.split 
    self.last_name = parts.size > 1 ? parts.last : "" 
  end 
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

# Solution
# We have to compare strings, simply comparing the objects bob == rob does not work. 
