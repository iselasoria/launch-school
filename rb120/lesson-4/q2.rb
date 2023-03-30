# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

# what is the result of the following?
trip = RoadTrip.new
p trip.predict_the_future

# in new RoadTrip object is instantiated on line 20. 
# Roadtrip inherits from Oracle so both of the methods in teh superclass become 
# availabe to it. Since the method predict_the_future gets called, Ruby will resolve it 
# from the parent class. Then, since the calling object is an instance of RoadTrip, Ruby will 
# come back to the boundaries of the RoadTrip class and search for a choices method to resolve it there,
# and it finds it, so the resul will be a concatenation of "You will" followed by one 
# of the choices in the array from the RoadTrip choices instance method. 
# changing the method name in the RoadTrip will make Ruby use the choices from the superclas 