# If I have the following class:
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method if any and how do you know?
# How do you call a class method?


# S: 
# the class method is manufacturer and we know this because it is prefixed with the ketword self 
# we can call it like this:
Television.manufacturer