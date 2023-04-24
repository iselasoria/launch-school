class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels
p Vehicle.wheels

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels
p Car.wheels


# What does the code above output, and why? What does this
# demonstrate about class variables, and why we should avoid
# using class variables when working with inheritance?

# S:
# line 9 will output 4 as that is the value of the class variable that is retrievable with the `self.wheels`
# class method. Then, on line 12, we reassign @@wheels to 2. Since in Ruby, class variables are shared amongst all
# instances of the class, this means we will see the 2 get propagated from this point fotward. Ruby first parses the
# code in the class definition and whatever the class variable is assigned to last will be the result it retains.
# In this case, it gets reassigned to 2 so now all the classes will have as the value of `@@wheels`.