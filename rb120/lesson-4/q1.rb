# You are given the following code:
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# what is the result of executing:

oracle = Oracle.new
p oracle.predict_the_future

# S: 
# we'll get a concatenated string of "You will" 
# followed by one of the choices in the array inside the choices instance method