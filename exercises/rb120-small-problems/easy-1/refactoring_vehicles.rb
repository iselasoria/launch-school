# Consider the following,
# refactor these classes so they all use a common superclass, and inherit behavior as needed.

class Vehicle
  attr_reader :make, :model # all the subclasses have make and model, we are writing with initialize so we only need to read 

  def initialize(make, model) # initialize the common make and model 
    @make = make
    @model = model
  end


  def to_s
    "#{make} #{model}" # this printing method is the same across all of them 
  end
end

class Car < Vehicle
  def wheels
    4 # wheels is different so we cant extract to Vehicle parent class 
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(@make, @model) # we pass the expected args to super initialzie
    @payload = payload # we add the third arguments here, only this class has this arg so we override initialzie method here 
  end
  def wheels
    6
  end

end

