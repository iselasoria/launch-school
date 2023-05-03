class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    return -1 if price < other.price
    return 0 if price == other.price
    return 1 if price > other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2 # => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1 # => Home 2 is more expensive


# What module/method could we add to the above code snippet to output
# the desired output on the last 2 lines, and why?


# the Comparable moduile can be included and will give us access to a collection of
# comparison methods but those methods expect -1, 0, or 1 in order to work so we have to ensure
# the spaceshipt opperator returns one of those numbers