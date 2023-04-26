# What is the difference between states and behaviors?
# state reffers to the collection of instance variables AND their values
# Behaviours refer to the methods that an object of a given class can respond to
# A main difference between the two is that behaviours are inherited, while state
# cannot be inherted. In the spirit of encapuslation, the state belong to a sparticular instance NOT to the class
# while behaviours belong to the class

class FireStation
  def main_role
    ""
  end
end

class FireFighter < FireStation
end
# todo