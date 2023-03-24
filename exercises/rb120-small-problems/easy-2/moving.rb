# given the following code:

module Walkable
  def walk 
    "#{name} #{gait} forward" # todo why does gait have to remain private?
  end
end
class Person

  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat

  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah

  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

# modify so this works:
mike = Person.new("Mike")
p mike.gait
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.gait
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.gait
# => "Flash runs forward"