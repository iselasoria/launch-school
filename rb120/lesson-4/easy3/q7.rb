# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color # these don't actually get used 

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green" # this explicit return is unnecessary
  end

end