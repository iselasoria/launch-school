# assume the following code:

class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end

end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# and this output
# Home 1 is cheaper
# Home 2 is more expensive

# Modify the House class so that the above program will work.
# You are permitted to define only one new method in House.

# using the Comparable module and the <=> gives us acces to a variety of
# different comparison functions like <, >, ==, etc. Here we define what constitues two
# houses being the same, and in this case, we decided it is only price. But the method
# definition is comething to keep in mind