class Character
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    # "#{@name} is speaking."
    "#{name} is speaking."
  end
end

class Knight < Character
  def name
    "Sir " + super
  end
end

sir_gallant = Knight.new("Gallant")
p sir_gallant.name # 'Sir Gallant'
p sir_gallant.speak # `Gallant is speaking`


# since the calling object is a Knight object, Ruby will first
# try to resolve all its methods as a Knigh object, searching for resolution
# within the boundaries of the class