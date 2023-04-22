module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
# teddy.enable_swimming
p teddy.swim


# What is output and why? What does this demonstrate about instance variables?
=begin
The code above will output nil. This is because the `enable_swimming` method that was mixed in via the module was
# never called and therefore the code never executed. When we call `swim`, the @can_swim instance variable is not truthy, because we
# didn't execute it.
=end