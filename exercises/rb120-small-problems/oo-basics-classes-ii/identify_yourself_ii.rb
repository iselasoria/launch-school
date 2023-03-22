# Update the following code so that it prints I'm Sophie! when it invokes puts kitty.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s # we override to_s
    "I'm #{Sophie}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty

# expected
# I'm Sophie!