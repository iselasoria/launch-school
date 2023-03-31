# How could you change the method name below so that the method 
# name is more clear and less repetitive?


class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def light_status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

# S:
# when naming methods we should consider how they will be called from their public interface 
# the method above will look like: my_light.light_status and that seems redundant. 
# we could just called it status and then the call would look like my_light.status