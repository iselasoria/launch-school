
# Paco's kid's spike
# There is a vehicle company called Cool Car Factory
# There are 3 trucks and two cars there.
# A blue garbage truck has orange wheels and picks up garbage
# An orange recycling truck has blue wheels and picks up recycling
# A purple car called Do Not Touch Anything Dirty has black wheels and if it touches something dirty says "hey don't touch any dirty stuff!"
# a green race car that races and has black wheels
# A red firetruck with black wheels that puts out fires
# All truck/car's of these types would have these same attributes and you can pass only one argument on instantiation
# all trucks can carry heavy stuff
# all cars and the firetruck can go fast
# all vehicles can drive
# calling puts on an object of any class should return a sentence describing that object

=begin
Restaurant Spike

- Restaurant has staff, and they all work and get paid
- Restaurant has servers that wear white shirts, serve orders and interact with customers
- Managers wear black shirts, can check inventory, serve orders and interact with customers
- Cooks can cook and check inventory, wear striped shirts
- Hosts seat guests and distribute menus, and interact with customers

Nouns:
- restaurant, staff, shirts, managers, cooks, hosts, shirt colors

Verbs:
- work, receive paycheck, serve orders, interact with customers, check inventory, cook, seat guests, distribute menus

=end

def probability_based_sample(tendencies)
  case rand(100)
  when tendencies[0] then 'rock'
  when tendencies[1] then 'paper'
  when tendencies[2] then 'scissors'
  when tendencies[3] then 'lizard'
  when tendencies[4] then 'spock'
  end
end

# goes rock paper scissors lizard spock
def assign_personality
  case name
  when 'Terminator'
    then [(0..30), (60..75), (75..90), (90..100), (30..60)]
  when 'Rusty'
    then [(0..25), (25..50), (50..90), (0..0), (90..100)]
  when 'Chappie'
    then [(0..25), (25..50), (50..75), (0..0), (75..100)]
  when 'Rosie Jetson'
    then [(0..25), (25..75), (75..90), (90..100), (0..0)]
  when 'Andy Roid'
    then [(0..33), (33..66), (66..99), (0..0), (0..0)] # ["rock","scissors"]
                                                          3.times array << "paper"
  when 'Mr. Roboto'
    then [(0..20), (20..40), (40..60), (60..80), (80..100)]
  end
end



module FrontOfTheHouse
  def interact_with_customer
    "Welcome to Shaky's!"
  end
end

module BackOfTheHouse
  def check_inventory
    "Hm...we're missing some things."
  end
end

class Staff
attr_reader :name, :job, :uniform

  def initialize(name, job, uniform)
    @name = name
    @job = job
    @uniform = Uniform.new(uniform)
  end

  def work
    "I'm a #{job.downcase}."
  end

  def collect_payment
    "Gimme my money!"
  end

end

class Uniform
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Manager < Staff
include FrontOfTheHouse
end

class Chef < Staff
  include BackOfTheHouse

  def cook
    "cook"
  end
end

class Host < Staff
include FrontOfTheHouse
end

joe = Chef.new("Joe", "Chef", "striped")
puts joe.uniform.color








# class Car
#   def initialize(make, model, fuel_calculator)
#     @make = make
#     @model = model
#     @fuel_calculator = fuel_calculator
#   end

#   def fuel_efficiency
#     @fuel_calculator.calculate_fuel_efficiency
#   end
# end

# class FuelCalculator
#   def initialize(fuel_capacity, distance_travelled)
#     @fuel_capacity = fuel_capacity
#     @distance_travelled = distance_travelled
#   end

#   def calculate_fuel_efficiency
#     @distance_travelled / @fuel_capacity
#   end
# end

# # Usage
# fuel_calculator = FuelCalculator.new(10, 200) # fuel capacity is 10 litres, and the car travelled 200km
# car = Car.new("Honda", "Civic", fuel_calculator) # fuel_calculator is the collaborator object
# car.fuel_efficiency # returns 20.0 (km per litre)

# ####################
# class Person
#   attr_reader :name
#   attr_accessor :location

#   def initialize(name)
#     @name = name
#   end

#   def teleport_to(latitude, longitude)
#     @location = GeoLocation.new(latitude, longitude)
#   end
# end

# class GeoLocation
#   attr_reader :latitude, :longitude

#   def initialize(latitude, longitude)
#     @latitude = latitude
#     @longitude = longitude
#   end

#   def to_s
#     "(#{latitude}, #{longitude})"
#   end
#   def ==(other)
#     (latitude == other.latitude) && (longitude == other.longitude)
#   end
# end

# # Example

# ada = Person.new('Ada')
# ada.location = GeoLocation.new(53.477, -2.236)

# grace = Person.new('Grace')
# grace.location = GeoLocation.new(-33.89, 151.277)

# ada.teleport_to(-33.89, 151.277)

# puts ada.location                   # (-33.89, 151.277)
# puts grace.location                 # (-33.89, 151.277)
# puts ada.location == grace.location # expected: true # Float#==
#                                     # actual: false

# https://medium.com/launch-school/no-object-is-an-island-707e59ffedb4
# topics =
# [X] Classes and objects

# [X] Use attr_* to create setter and getter methods
  # class Person
  #   attr_accessor :name
  #   attr_reader :salary

  #   def initialize(name)
  #      @name = name
  #   end

  #   # def method
  #   #   @method
  #   # end

  #   # def method=(method)
  #   #   @method = method
  #   # end

  #   def salary=(amount)
  #     @amount = amount * (2)
  #   end

  #   def to_s
  #     "The person makes #{@amount}"
  #   end

  # end

  # person = Person.new('cruz')
  # # person.salary(1000)
  # puts person
  # puts person.name

# [X] How to call setters and getters
# # [X] Instance variables, class variables, and constants including the scope of each type and how inheritance can affect that scope
# BRAND = 'Chrysler'

# class Vehicle
#   BRAND  = 'Ford'

#   @@wheels = 4

#   def wheels
#     @@wheels
#   end
# end

# class Motorcycle < Vehicle
#   BRAND = 'Harley Davidson'
#   #@@wheels = 2
# end

# class Car < Vehicle
#   @@wheels = 7

# end

# # Whatever is defined last modifies the value of the class variable. Last modification takes precedence.


# #v = Vehicle.new
# # v.wheels
# # puts Vehicle::BRAND
# # puts Motorcycle::BRAND

# # Constants have lexical scope...available wherever it's defined...
# # Travels up the ineritance chain


# # [X] Instance methods vs class methods
# # [X] Method Access Control
# class Person
#   attr_accessor :name, :number

#   def initialize(name, ssn)
#     @name = name
#     @number = ssn
#   end

#   def check_dupes(p2)
#     same_num?(p2)
#   end

#   protected

#   def same_num?(other)
#     @number == other.number
#   end
# end

# person1 = Person.new("Ana", "1234")
# person2 = Person.new('Joe',"1234")
# p person1.same_num?(person2)

# puts person1.same_num?(person)
# private methods are not passed down the inheritance chain, protected ones are
# private methods cannot call self because calling self is the equivalent of making a call from the public interface.

# class Duck
#   def quack
#     puts "Quack quack!"
#   end
# end

# class Person
# # include displayable
# # include formatable

#   def quack
#     puts "I'm quacking like a duck!"
#   end
# end

# def make_quack(object)
#   object.quack
# end

# duck = Duck.new
# person = Person.new

# make_quack(duck)   # Output: "Quack quack!"
# make_quack(person) # Output: "I'm quacking like a duck!"

# [X] Referencing and setting instance variables vs. using getters and setters
# [X] Class inheritance, encapsulation, and polymorphism
# [X] Modules
# [X] Method lookup path
  # ancestors
  # current class, modules (if multiple, looks in the last one included), super class, Kerne, etc.

# [X] self
  # is used prepended to method names to make them class methods
  # prepended to instance methods, to reference their setter

#   class Human
#     attr_accessor :name

#     def initialize(name)
#       @name = name
#     end

#     def give_nickname(name)
#       self.name = name # self references the calling object
#     end

#     def self.say_hi
#       puts "#{name} says hi"
#     end

#   end

#   person1 = Human.new("Isela")
#   person1.give_nickname("Xela")
#   # p person1.name
#  puts person1.name
# [X] Calling methods with self
# [X] More about self
# [X] Reading OO code
# [] Fake operators and equality

=begin
BasicObject#==

equal? - compares both objects, returns true if they are the same object


eql? - used implicitly by hash
=== - used implicitly in case statements; (2...6), 5

=end
# obj1 = "hello"
# obj2 = obj1
# puts obj1.object_id
# puts obj2.object_id
# puts obj1.equal?(obj2)
# -
# &&
# <
# . :: highest precedence

# GREETING = "hi"

# class Person
# #GREETING = "Bye"
# end

# puts Person::GREETING
# puts GREETING

# [X] Working with collaborator objects
# [] Create a code spike
