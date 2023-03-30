class Passenger
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def sing(second_person)
    "what a wonderful worlddd"
    p "#{speak} #{second_person.speak}"
  end
  
  protected
  
  def name=(name)
    @name = name
  end

  def speak
    "and i think to myself"
  end 
end

# protedcted methods are accessible to two separate instances of the class, 
# while private methods are only accessible to the same instance of the class
# that is executing them as long as the call is another PUBLIC method in the class, 
# and not a call from outside it. 



linda = Passenger.new('Linda')
joanne = Passenger.new('Joanne')
p joanne.sing(linda)

#  private--> calling isntance 
# protected --> can be invoked by another instance of the class or any instance of the subclass 

# starts seach in the structure where it referenced 
# goes up the hierarchy
# lastly goes to main scope but if tou use constant resolutiion operator it wont find it self.class::CONS
