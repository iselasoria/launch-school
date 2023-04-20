=begin
On lines 37 and 38 of our code, we can see that grace and ada are
located at the same coordinates. So why does line 39 output false?
Fix the code to produce the expected output.
=end
class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  def ==(other)
    latitude == other.latitude && longitude == other.longitude
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false

# S:
# since we are comparing objects of a custom class, we need to define the
# implementation of ==. Otherwise, we resort to the implementation that came down from
# BasicObject, and this will check for whether two objects are literally the same object. Instead, we
# want out implementation to check that the values are the same.