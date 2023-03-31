# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # this throws an error because manufacturer is a class method, so we should call it on the class itself 
tv.model # this is run 

Television.manufacturer # this will work, manufacturer is a class method
Television.model # this won't because it's an instance method being called on the class