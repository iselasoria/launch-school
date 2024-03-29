=begin 
Using the following code, add an instance method 
named #rename that renames kitty when invoked.

=end 

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name # we use self so Ruby knows we want to use the `name` setter method NOT initialize a new local variable
  end
end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name

# expected 
# Sophie
# Chloe