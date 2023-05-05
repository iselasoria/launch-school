# Use attr_* to create setter and getter methods
# getter---> attr_reader --> retrieve
# setter --> attr_writer --> change
# since state is encapsulated, we need methods to itneract with it

class Cat
  # attr_reader :name
  # attr_writer :name
  # attr_accessor :name
  attr :name, true

  def initialize(name)
    @name = name
  end

  # def name
  #   @name
  # end

  # def name=(new_name)
  #   @name = new_name
  # end
end

pebbles = Cat.new('Pebbles')
p pebbles.name
p pebbles.name = ('Breadcrumbs')

### Garrett
#### How to call setters and getters

class Car
  attr_accessor :year

  def initialize(year, color)
    @year = year
    @color = color
  end

  # def year
  #   @year
  # end

  def year=(new_year)
    @year = new_year
    new_year + 2
  end
end

honda_crv = Car.new(2015, 'Red')
p honda_crv.year
p honda_crv.year = 2016
p honda_crv.year
##########################################################################
# Instance variables, class variables, and constants, including the
# scope of each type and how inheritance can affect that scope
#


# Instance variables, class variables, and constants, including the scope of each type
# and how inheritance can affect that scope

class Computer
  def Computer.storage
    "1 terabyte"
  end

  attr_accessor :brand

  def initialize(brand)
    @brand = brand
  end
  def power_on
    @power_button = 'on'
  end
end

class Laptop < Computer
end

mac = Laptop.new('Mac')
# p Laptop.instance_methods
# p mac.instance_variables
# p Computer.singleton_methods

# hp = Laptop.new('HP')
# p hp

obj = Object.new

def obj.talk
  "talking"
end

# p obj.singleton_methods
# p obj.talk

#### class var
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

class Car < Vehicle
end

class Motorcycle < Vehicle
  def update_wheels
    @@wheels = 2
  end
  # @@wheels = 2
end

hd = Motorcycle.new
hd.update_wheels
# p Motorcycle.wheels

# class-hierarchy scoped

#######
# lexically resolved
# look up the inheritance chain
# top scope
# namespace resolution operator

KEYS = "Toy Keys"

module SpareKeys
  # KEYS = "Car keys"
end

class House
  KEYS = 'House keys'
end

class Livingroom < House
include SpareKeys
  # KEYS = "Safe keys"

  def find_keys
    SpareKeys::KEYS
  end
end

home = House.new
# p home.find_keys
lr = Livingroom.new
# p lr.find_keys

p House::KEYS

# current enclosing structure, modules (last to first added), superclass, all Ruby superclasses

#### Instance methods vs. class methods

class Person
  def Person.talk

  end

  def self.talking
    "talking"
  end

  def think
    self

  end
end

# p Person.talk
# p Person.talking
# begin
#   p Person.think
# rescue
#   puts "not psosible"
# end
p Person.new.talk
p Person.new.think

#####

#### Method Access Control
# public
# private
# protected

class GoldenGirls
  include Comparable
    attr_reader :name

    def initialize(name, age)
      @name = name
      @age = age
    end

    # def change_age(other)
    #   other.age = age + 10
    # end
    def is_older?(other)
      age <=> other.age
    end

    def test
      "test"
    end

    protected

    attr_reader :age

    private :test

  end

  blanche = GoldenGirls.new("Blanche Deveraux", 51)
  dorothy = GoldenGirls.new("Dorothy Zbornak", 55)
  # p blanche.change_age(dorothy)
  p blanche.is_older?(dorothy)
  p blanche.test

  #### referencing instance vs getter/setter

class Person
  attr :name, true

  def initialize(name)
    @name = name
  end

  def talk
    "#{name} is talking"
  end

  def change_name(new_name)
    self.name = new_name
  end

end

garrett = Person.new("Garrett")
p garrett.talk
p garrett.change_name("Rosa")
p garrett.name


# #### Class inheritance, encapsulation, and polymorphism

# class inheritance --> is-a relationship
class Grandma
  attr_reader :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def speak
    "Hola buenos dias"
  end
end

class Mom < Grandma

end

class Me < Mom
  def speak
    "Good morning"
  end
end

rosa = Me.new("Rosa", 32)
p rosa.age
juan = Me.new("Juan", 17)
p juan
teresa = Mom.new("Teresa", 58)
p teresa.speak
p rosa.speak


class BallroomDancer
  def dance
    " I'm a ballroom dancer from Denver."
  end
end


class BellyDancer
  def dance
    "I'm a belly dancer from Cairo."
  end
end

class SalsaDancer
  def dance
    "I'm a salsa dancer from Havana."
  end
end

itnl_dance_competition = [BallroomDancer.new, BellyDancer.new, SalsaDancer.new]

itnl_dance_competition.each {|dancer| p dancer.dance}

### Modules
# use cases: inheritance, organization, module methods

module Runnable
  def run
    "can run"
  end
end

class Cheetah
  include Runnable
  extend Runnable
end

class Dog
  include Runnable
end

class Whale

end

p Cheetah.new.run
p Cheetah.run
p Dog.new.run
# p Whale.new.run

module American
  class Architect
    def nationality
      "USA"
    end
  end
end

module French
  class Architect
    def nationality
      "French"
    end
  end
end

p American::Architect.new.nationality
p French::Architect.new.nationality

module Calculation
  def self.celsius(f)
    f * (5/9) - 32 # (°F − 32) × 5/9
  end
end

p Calculation.celsius(212)

#### Method lookup path

# enclosing structure
# modules (lastt to first added)
# superclass
# Kernel, Object, BasicObject

module Play
  def fetch_ball
    "I'm a dog that fetches"
  end
end

class Animal
end


class Dog < Animal
  def fetch_ball
    "fetching the ball"
  end
end

class Poodle < Dog
  prepend Play # forces Ruby to search the module mixin before current structure

  def fetch_ball
    "The poodle is fetching the ball"
  end
end

fido = Poodle.new
p fido.fetch
p Poodle.ancestors

##### self

p self

def example
  "nil"
end

module Testable
  p self
end

class Test
  include Testable
  p self

  def self.random
    p self
  end

  def helper
    "hi"
  end

  def imethod
    p helper
    p self.helper
  end
end

Test.random
Test.new.imethod

p example
p self.example

#### (be able to) Read[ing] OO code
def greet
  wave
end

# p greet

def wave
  "waving hello"
end

p Object.private_instance_methods(false)

class Person
  def shake_hand
    say_hello
  end
end

pete = Person.new
# p pete.shake_hand

class Person
  def say_hello
    "hi"
  end
end

p Person.instance_methods(false)



#### Fake operators and equality

#  + -- > something.+(something_else)
# they should return an object of the type that called it
  # apples + apples =/= pears

  class House
    attr_reader :price, :address

    def initialize(address, price)
      @address = address
      @price = price
    end

    def ==(other)
      (price == other.price) && (address == other.price) # Integer#==
    end

  end

  mansion = House.new("123 Bel Air Ave, Bel Air, CA", 1000000)
  townhome1 = House.new("456 Main St, Fort Worth TX", 200000)
  townhome2 = House.new("666 Elm St, Chicago IL", 200000)
  # price
  p townhome1 == townhome2

  class Animal
    def initialize
      @all = []
    end

    def +()
    end
  end

  class Bird < Animal
  end

  class Fish < Animal

  end

  #### Working with collaborator objects

class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Hospital
  attr_accessor :patients

  def initialize
    @patients = []
    # patients = [Person.new('Joe', 33)]
  end

  def add_new_patient(person)
    patients << person
  end
end

local_hospital = Hospital.new
garrett = Person.new('Garrett', 29)
manasi = Person.new("Manasi", 30)

local_hospital.add_new_patient(garrett)
local_hospital.add_new_patient(manasi)

p local_hospital.patients

# mention have a has-a associative relationship