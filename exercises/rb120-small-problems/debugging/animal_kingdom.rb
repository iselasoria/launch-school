=begin
The code below raises an exception. Examine the error message
and alter the code so that it runs without error.
=end

class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

# S:
# The issue here was with the arguments being forwarded to the initialize method in the
# parent class. Without arguments or parentheses, super will by default forward all
# the arguments that its enclosing method was given. But the issue here is the songbird has three arguemtns,
# but the initialzie method in the superclass only takes two arguments and thus it threw an error
# We can simply fix this by specifying the arguments we want to pass up with super, like on line 42
# The constructor method in the FlightlessBird class is uncessesary because all it does is pass arguments to super, but we can just do that with the
# the constructor in the Animal class