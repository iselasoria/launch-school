
### Referencing and setting instance variables vs. using getters and setters
```ruby

class Computer
  attr_accessor :brand


  def initialize(brand)
    @brand = brand
  end

  # def brand=(brand_change)
  #   @brand = brand_change
  # end
end

hp = Computer.new('HP')
p hp.brand = 'Hewitt Packard'
p hp
```

### Class inheritance, encapsulation, and polymorphism
```ruby
class Country
  def place_of_birth
    "USA"
  end
end

class GeographicState < Country
  def place_of_birth
    "New York"
  end
end

class City
  def place_of_birth
    "Buffalo"
  end

  def latlong
    @lat = 34.55
    @long = 118.55
  end
end

locations = [Country.new, GeographicState.new, City.new]

locations.each {|place| p place.place_of_birth }

los_angeles = City.new
p los_angeles.lat
```

### Modules
```ruby
module Nationality
  def display_nationality
    "American"
  end
end


class Country
  def place_of_birth
    "USA"
  end
end

class GeographicState < Country
include Nationality

  def place_of_birth
    "New York"
  end
end

class City
  def place_of_birth
    "Buffalo"
  end

  def latlong
    @lat = 34.55
    @long = 118.55
  end
end

locations = [Country.new, GeographicState.new, City.new]

locations.each {|place| p place.place_of_birth }

los_angeles = City.new
# p los_angeles.lat

california = GeographicState.new
p california.display_nationality

module WildAnimals
  class Tigers
  end

  class Bears; end

  class Dog
    def bite
      "You might die"
    end
  end
end

module Pets
  class Cat
  end

  class Dog
    def bite
      "You'll be alright"
    end
  end
end

dingo = WildAnimals::Dog.new
p dingo.bite
fido = Pets::Dog.new
p fido.bite

# modules as containers

module Celebration
  def self.fireworks
    "4th of July Fireworks!"
  end
end


p Celebration.fireworks
```

### Method lookup path
```ruby
module SummerCourse
  def semester
    "Summer 2023"
  end
end

module FallCourse
  def semester
    "Fall 2023"
  end
end

class AcademicSubject
  def name_of_course
    "Physics 101"
  end
end

class Course < AcademicSubject

end

class Section < Course
include FallCourse
include SummerCourse
end

physics101 = Section.new
p physics101.name_of_course
p physics101.semester
p Section.ancestors
```
_Kernel is a module_

### self, Calling methods with self, More about self
```ruby
## self

module Jewelry
  p self.class

  def self.gold_content
    "24k"
  end
end

p Jewelry.gold_content
puts "\n"

class Television
  attr_reader :morning_show

  p self.class

  def self.network
    "BBC"
  end

  def initialize(morning_show_name)
    puts "self in an instance method is #{self}"
    @morning_show = morning_show_name
  end

  def morning_show=(new_show)
    @morning_show = new_show
    #p morning_show
  end
end

p Television.network

gmb = Television.new("Good Morning Britain")
p gmb
gmb.change_morning_show('Good Evening Britain')
p gmb

# writer methods  with the = syntax need to reference the ivar
# change methods taht are NOT setters, can refeerence the getter for the ivar, but the writer must also exist!


```

### Reading OO code

### Fake operators and equality
```ruby
class Student

  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  # def ==(other)
  #   name == other.name
  # end

  def self.test
    "test"
  end

  class << Student
    def test2
      "kind of okay"
    end
    private :test
  end

  private

  include Comparable

  def <=>(other)
    age <=> other.age
  end

  # def <(other)
  #   name < other.name
  # end

end

joe = Student.new('Ana', 28)
ana = Student.new('Anas', 23)

# p joe <=> ana
p joe == ana
# p joe > ana
# p joe < ana
# Student.test

obj = Object.new

def obj.test
  "okay"
end

p obj.test
new_obj = Object.new

class << obj
  def test
    "not okay"
  end
end

p obj.test
p Student.test2


class HighSchool
  def initialize(staff)
    @staff = [Teacher.new, SchoolAdmin.new]
  end
end

class Teacher; end
class SchoolAdmin; end
```

# How does inheritance work in Ruby? When would inheritance be appropriate?

class Engineer
  def initialize(name, discipline)
    @name = name
    @discipline = discipline
  end

  def work
    "I need to get licensed by the state first!"
  end

  def license(state)
    "Lincensed in the state of: #{state}"
  end
end

class CivilEngineer < Engineer
  def work
    "Build bridges"
  end
end

class MechanicalEngineer < Engineer
  def work
    "I design engines"
  end
end

david = CivilEngineer.new("David LoRicco", "Civil Engineer")
p david
p david.license("Nevada")

john = MechanicalEngineer.new("Joe Goldberg", "Mechanical Engineer")
p john
p john.license("Wisconsin")



# Classes
class Animal
end

# Objects
class Computer
  def initialize(brand)
    @brand = brand
  end
end


latop = Computer.new('Hewitt Packard')
# p latop

# instance variables
# * never inherited TBD
class Dog
  attr_reader :breed # getter

  def initialize(breed,name)
    @breed = breed
    @name = name
  end
end

ruby = Dog.new("no idea", "Ruby")
brady = Dog.new("Collie", "Brady")
# p ruby.breed
# p brady.breed

# class variables
class CourseCatalogue
  @@cost_per_unit = 600

  def self.cost_per_unit
    @@cost_per_unit
  end

  def initialize(course_name)
    @course_name = course_name
  end
end

class Honors < CourseCatalogue

  def increase_tuition
    @@cost_per_unit = 1000
  end


end

phy101 = CourseCatalogue.new('PHY 101')
phy130 = CourseCatalogue.new('PHY 130')
# p phy101
# p phy130
# p CourseCatalogue.cost_per_unit

# p phy101.class.cost_per_unit
# p phy130.class.cost_per_unit

# constants
module Garage
  KEYS = 'Car keys!!'
end

KEYS = "You left them at a friend's house!"

class House
  KEYS = 'House Keys'

  def search_for_car_keys
    KEYS
  end
end

class Livingroom < House
  KEYS = 'Toy Keys'
end

class Bedroom < House
include Garage
  KEYS = 'Safe Keys'

end

p room = Bedroom.new
p room.search_for_car_keys

# Now, the core question is what will be the output when search_for_car_keys method is called. This method is defined in the House class and returns the KEYS constant. When this method is called from an instance of the Bedroom class, Ruby's constant lookup path starts from the class where the method is called, which is Bedroom in this case.

# In Ruby, constants have lexical scope. When you call KEYS within search_for_car_keys, it will look for the constant in the lexical scope of where the method is defined. Since KEYS is defined in the House class where the method is defined, it will use that value.


##########

## inheritance
  # method overriding
  class LaunchSchool
    def enrollStudent
      "Student enrolled into LS"
    end
  end

  class OOP < LaunchSchool
    def enrolledStudent
      "Student enrolled in OOP"
    end
  end


## duck-typing

class robot #
  def movebody
    "dancing salsa"
  end
end

class adult #
  def movebody
    "dancing ballet"
  end
end

def baby
  def movebody
    "rolls over"
  end
end

sofia = SalsaDancer.new
anna = BalletDancer.new

dancers = [sofia, anna]

dancers.each {|d| p d.dance}


include Comparable

class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def <=>(other_person)
    age <=> other_person.age
  end
end

rich = Person.new("Rich", 30)
christina = Person.new("Christina", 30)

p rich > christina


p rich == christina


class Animal
  def initialize(name)
    @name = name
  end

  def inspect
    "I am #{@name}"
  end
end

ruby = Animal.new("Ruby")

p ruby.inspect

class Water
  def freeze
    puts "the water has frozen"
  end
end


# Modules and classes can both be utilized to share behavior. Classes do so through inheritance, whereas modules do so through mixing-in. Ruby, however, only allows for single inheritance, while in contrast you can mix in as many modules as you would like (providing a bit more flexibility). Furthermore, you can't instantiate objects from modules, but you can from classes.

#   In order to determine whether to share behavior via a module or a class, you want to look at the relationship. If there is an "is-a" relationship, class inheritance is more fitting, whereas if there is a "has-a" relationship, module mixins would be more fitting.


class Animal
  attr_reader :name

  def initialize(name, age, weight)
    @name = name
    @age = age
    @weight = weight
  end

   def large_dog?
    weight > 40
   end

   def older_than?(other_animal)
    age > other_animal.age
   end

  protected

  attr_reader :age

  private

  attr_reader :weight

end

ruby = Animal.new("Ruby", 0.5, 44)

p ruby.name

# p ruby.weight

p ruby.large_dog?

maggie = Animal.new("Maggie", 13, 85)

# p ruby.age

p ruby.older_than?(maggie)