# consider the following class
class Machine
  attr_writer :switch

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

# Modify this class so both flip_switch and the setter method switch= are private methods.

# S:
# The solution is move the setter for `switch` down to the private section of the class definition
# along with the `flip_switch` method. Then, since the flip switch is now private, the self can go away
# because we will call it on a Machine object and so it will reference the Machine and is therefore not necessary.
# Note that the self in the flip_switch must stay because self is necessary when calling an setter method

class Machine
  def start
    flip_switch(:on)     # self here would be accepted but redundant
  end

  def stop
    flip_switch(:off)     # self here would be accepted but redundant
  end

  def current_state
    puts "This machine is #{switch}"
  end

  private

  attr_writer :switch
  attr_reader :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

maquina = Machine.new
maquina.start
puts maquina.current_state