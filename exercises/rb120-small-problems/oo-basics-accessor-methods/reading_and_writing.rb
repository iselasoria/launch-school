# Add the approriate accessor to the following code:
class Person
  attr_reader :name
  attr_writer :name 
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name

# expected 
# Jessica