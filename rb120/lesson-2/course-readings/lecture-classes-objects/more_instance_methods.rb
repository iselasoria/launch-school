=begin 
Now create a smart name= method that can take just a first name or a 
full name, and knows how to set the first_name and last_name appropriately.


bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
bob.first_name            # => 'John'
bob.last_name             # => 'Adams'



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

bob = Person.new('Robert Jones')
p bob.name
p bob.last_name
p bob.first_name