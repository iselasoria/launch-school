=begin
Golden Girls Spike

The girls live in a house with an address of 6151 Richmond Street Miami, FL. There are four inhabitants of the house:
- Dorothy Zbornak
- Blanche Deveraux
- Rose Nylund
- Sofia Petrillo

All of the girls are American, except for Sofia-- she's Italian. All the girls work, except for Sofia. All of them are widows, except for Dorothy.
- Only Dorothy stays home on Saturday evenings.
- Only Rose has a long-term boyfriend.
- Only Blanche dates younger men.
- All of the girls are over 50.
- All the girls are in the dating scene, except for Rose
- Dorothy has an ex-husband by the name of Stan Zbornak.

=end
module Widow
  def widow?
    puts "My husband died"
  end
end

module Foreign
  PLACE_OF_BIRTH = 'Italy'
end

module Dating
  def date
    "I have a date on Friday"
  end
end

class Girls
  attr_reader :name, :age

  include Foreign

  PLACE_OF_BIRTH = "USA"

  def initialize(name, age, nationality)
    @name = name
    @age = age
    @nationality = nationality
  end

  def intro
    "#{name} says: "
  end
end

class Dorothy < Girls
include Dating

  def intro
    exhusband = Exhusband.new('Stan')
    p super + "One mistake in high school and now I can't get rid of #{exhusband.name}!"
    exhusband.greet
  end
end

class Sofia < Girls
include Dating
include Widow

  def intro
    super + "Picture it! Sicily, 1922. A young peasant girl..."
  end
end

class Rose < Girls
include Widow

  def intro
    super + "Back in Saint Olaf..."
  end
end

class Blanche < Girls
include Dating
include Widow

  def intro
    super + "Hi, I'm Blanche Deveraux. I just turned #{age - 12}."
  end

  def datenight
    "I have a date with handsome man who's in his 20s, slightly younger than me."
  end
end

class Exhusband
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hi! It's me, Stan!"
  end
end

class House
  attr_reader :inhabitants

  def initialize(address, inhabitants)
    @address = address
    @inhabitants = inhabitants
  end

  def episode(household)
    household.inhabitants.each {|girl| p girl.intro}
    puts "\n"
  end
end


inhabitants = [Blanche.new("Blanche Deveraux", 51, Girls::PLACE_OF_BIRTH),
            Sofia.new("Sofia Petrillo", 80, Foreign::PLACE_OF_BIRTH),
            Rose.new("Rose Nylund", 52, Girls::PLACE_OF_BIRTH),
            Dorothy.new("Dorothy Zbornak", 55, Girls::PLACE_OF_BIRTH)]

household = House.new("6151 Richmond Street Miami, FL",inhabitants )

p household.episode(household)