# What is the difference between instance methods and class methods?
# instance methods are bahaviours the instances of a given class have access to.
# Once used, the response to those behaviours is individual to each instance that responded to it
# with class methods, they must be called on the class itself rather than on instances of the class
# class methods have the keyword self prepended to them.

class Bird
  @@wing_span = 5

  def self.wing_span
    @@wing_span
  end
end

class BlueJay < Bird
end

p BlueJay.wing_span

# todo check if class methods are inherited too