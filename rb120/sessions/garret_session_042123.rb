# =begin
# Strategy: per Ali
# - [ ] Object Oriented Programming
#     - course talks about why this was created
#     - know why certain types exist
#     - Why was OOP created and how did it solve the problems it was created to solve.
#       - programming paradigm, way to organize code to make it more maintainable, flexible, easy to think about.
#       - problem it tries to solve, as programs grew larger and more complex it became harder to maintain.
#       - there were a lot of dependencies causing ripple effects. Making small changes in one part of the program causing ripple effects.
#     - How does it solve?
#       - implements encapsulation: 1. creates containers for data and functionality called classes and objects
#             2. building blocks of the entire program. Independent of each other, and manipulating one of them doesn't affect the other.
#             3 .creates explicit boundaries
#             4. helps with data protection
#       - implements polymorphism: helps to increase reusability of code and keeping logic in one place, which helps again with maintainability and increases flexibility in the code by extending functionality.
# - [ ] Classes and objects
# # attributes are the limbo state and when you bind data they are ivars?!
# - [ ] Use attr_* to create setter and getter methods
# - [ ] How to call setters and getters
# - [ ] Instance variables, class variables, and constants, including the scope
# - [ ] Instance methods vs. class methods
# - [ ] Method Access Control
# - [ ] Referencing and setting instance variables vs. using getters and setters
# - [ ] Class inheritance
# - [ ] encapsulation
# - [ ] polymorphism
# - [ ] Modules
# - [ ] Method lookup path
# - [ ] self
# - [ ] Calling methods with self
#     - [ ] More about self
# - [ ] Reading OO code
# - [ ] Fake operators and equality
# - [ ] Working with collaborator objects
# - [ ] Spikes
# for each topic come up with bullet points


# You are building an application for Airplane Flight.
# Every airplane ride has 2 pilots, 2 flight attendants and 10 passengers. A mechanic supports the team from the ground.
# Everyone that’s on an Airplane Flight has medical clearance.  A Mechanic cannot be on the plane.
# Every employee is a part of the airline’s workforce. They all work and get paid.
# Pilots can fly and Mechanics can fix the engine of a plane.
# Flight attendants, pilots, and mechanics are all a part of a union and they pay dues.
# Passengers can do a lot of actions: ride, buy food, drink alcohol, pay for a ticket, and accrue miles.
#  The flight attendant, pilot and passenger can breathe at high altitudes, but a mechanic cannot.
# Keep track of how many airplane rides are happening at the same time.
# Keep track of how many airplane employees are on the plane at a time.
# Every airline employee gets 4 to 10 hours of sleep a night except a pilot who only gets 4-6 hours a night.

# nouns -- airplane
#             pilots
#             flight attendants
#             passengers
#             mechanic

#             medical clearance
#             union member
#             sleep

#             how many rides
#             how many emps
# verbs -- work (all airline emps)
#           get paid (all airline emps)
#           fly (pilot)
#           fix engine (mechanic)
#           pay dues (all airline emps)
#           breathe

#   Passengers can do a lot of actions: ride, buy food, drink alcohol, pay for a ticket, and accrue miles.
# =end

# module HighElevation
#   MEDICAL_CLEARANCE = true

#   def breathe_at_altitude
#     "can breathe"
#   end
# end

# class AirlineEmployee
#   attr_reader :union_member

#   def initialize
#     @union_member = true
#     @sleep = (4..10).to_a.sample
#   end

#   def work
#     "am working"
#   end

#   def get_paid
#     "receive pay"
#   end

#   def pay_dues
#     "paying to stay in union"
#   end
# end

# class Pilot < AirlineEmployee
#   include HighElevation

#   def initialize
#     super
#     @sleep = (4..6).to_a.sample
#   end

#   def fly
#     "can fly"
#   end
# end

# class FlightAttendant < AirlineEmployee
#   include HighElevation

#   # def initialize
#   #   super
#   # end
# end

# class Mechanic < AirlineEmployee
#   # def initialize
#   #   super
#   # end

#   def fix_engine
#     "fix"
#   end
# end

# class Passenger
#   include HighElevation

#   def ride
#   end

#   def buy_food
#   end

#   def drink_alcohol
#   end

#   def pay_for_ticket
#   end

#   def accrue_miles
#   end
# end

# class AirplaneFlight
#   attr_reader :employees, :passengers

#   @@num_rides = 0

#   def initialize
#     @employees = []
#     @passengers = []
#     2.times { employees << Pilot.new }
#     2.times { employees << FlightAttendant.new }
#     10.times { passengers << Passenger.new }
#     @@num_rides += 1
#   end

#   def self.total_flights
#     @@num_rides
#   end

#   def num_employees
#     employees_on_plane.size
#   end
# end

# new_flight = AirplaneFlight.new
# p new_flight
# flight2 = AirplaneFlight.new
# p AirplaneFlight.total_flights

# # def initialize
# #   @staff = []
# #   2.times {staff << OralSurgeon.new}
# #   2.times {staff << Orthodontist.new}
# #   staff << GeneralDentist.new
# # end

# # https://www.youtube.com/watch?v=6snbSBV8gww

# class Animal
#   #TYPE = "Short Hair"
# end

# class Cat < Animal

#   def initialize(name)
#     @name = name
#   end

#   def what_am_i?
#     p self
#     self
#   end

#   def hair_type
#     TYPE
#     # self.class::TYPE
#   end
# end

# class Persian < Cat
#   TYPE = "Long Hair"

#   # def hair_type
#   #   TYPE
#   # end
# end

# fluffy = Persian.new('Fluffy')
# p fluffy.what_am_i? # what is output?
# p fluffy.hair_type

# provide example of collaborator objects, explain what they are and why they are useful
class FootballMatch
  def initialize(ball)
    @ball = ball
  end
end

class Football
end

footie = Football.new
final_match = FootballMatch.new(footie) # this might reduce dependencies
p final_match