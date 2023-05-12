KEYS = "Toy keys"

module SpareKeys
  KEYS = "Spare car keys"
end

class House
  # KEYS = "House keys"
end

class Livingroom < House
  # KEYS = "Safe keys"
end

class Bedroom < House
# include SpareKeys
  KEYS = "Car Keys"
  def find_keys
    Livingroom::KEYS
  end
end

room = Bedroom.new
p room.find_keys


class OfficeWorker
  def initialize(name, age, location)
    @name = name
    @age = age
    @location = location
  end

  def greet(other)
    puts "#{name}: Hello #{other.name}"
    puts "I know you are in #{other.location}" # => NoMethodError
  end

  protected

  attr_reader :age, :name

  private

  attr_reader :location
end

john = OfficeWorker.new("John", 43, "SF")
betsy = OfficeWorker.new("Betsy", 21, "NY")

begin
  john.name # => NoMethodError
rescue
  puts "That is protected information"
end

john.greet betsy
