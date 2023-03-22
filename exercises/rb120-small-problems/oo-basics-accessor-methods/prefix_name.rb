=begin 
Using the following code, add the appropriate accessor methods so that @name is 
returned with the added prefix 'Mr.'.

=end 

class Person
  attr_writer :name # we need to write it as normal 


  def name  # we need to read it with extended functionality, so we override the getter
    "Mr. #{@name}"
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name

# expected 
# Mr. James