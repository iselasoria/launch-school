# OOP, what is the purpose of it?


# Classes and objects
  # class Dog
  #   attr_reader :name, :speakable
  #   @@number_of_dogs = nil

  #   def self.number_of_dogs
  #     @@number_of_dogs
  #   end

  #   def initialize(name, *speakable)
  #     @name = name
  #     @speakable # has a default value of nil
  #   end

  #   def speak
  #     @speakable = true
  #   end
  # end

  # p Dog.number_of_dogs

  # class BullDog < Dog
  #   @@number_of_dogs = 2
  # end

  # dog = Dog.new("ed") # an instance of the Dog class
  # p dog #<Dog54357438,@name=ed>
  # p dog.speakable
  # dog.speak
  # p dog #<Dog54357438 @name=ed @speakable=true>
  # p dog.speakable

  # spot = Dog.new("spot")
  # p spot.name
  # p dog.name
# https://ruby-doc.org/core-3.0.2/Class.html

# p dog.class.ancestors
# p Dog.class.ancestors
# p dog.instance_variables
# p Dog.class.superclass
# p Dog.allocate
# p Dog.inherited
# p new_class = Class.new
# p new_class.new

  # classes encapsulate behavior and objects encapsulate state

# Use attr_* to create setter and getter methods

  #- basics for the accessor methods

# class Person
  # attr_reader :name

  # def name
  #   @name
  # end

  # def name=(other_name)
  #   @name = other_name
  # end

#   def change_name(other_name)
#     self.name = other_name
#     p "Hi, I'm now #{name}"
#   end

#   private

#   attr_accessor :name
# end

# amy = Person.new
# #amy.name = "Amy"
# amy.change_name("Rosa")
# # p amy.name

## accessor methods are the attrs, access modifiers are the private/protected/public


# How to call setters and getters
# Instance variables, class variables, and constants, including the scope of each type and how inheritance can affect that scope

# GREETING = "Hi you"

# module Greetable
#   GREETING = "Hello darkness my old friend"

#   def self.module_method
#     "Hey, I'm a module method!"
#   end

#   def module_instance_method
#     "Hey I can be used on #{self}"
#   end
# end

# p Greetable.module_method

# class Hello
#   #include Greetable
#   extend Greetable
#   # GREETING = "Hi friend"

#   def greet
#     puts "#{Greetable::GREETING}"
#   end
# end

# say_hi = Hello.new
# say_hi.greet
# # p say_hi.module_instance_method
# p Hello.module_instance_method
# p Hello.module_method

# Constant Resolution in Ruby
# 1. Lexical Scope
# 2. Inheritance Chain
     # enclosing structure, module(from last included to first included), superclass, all the other Ruby class
# 3. Top level scope

# module A
# end

# module B
# end

# module C
# end

# module D
# end

# class Person
#   include A, B, C, D
#   #include
# end

# p Person.ancestors
# # [Person, modules(CD, AB), superclasses, etc]
# # [Person, modules(ABCD), superclasses, etc]

# class Person
#   attr_reader :name, :age

#   def initialize(name)
#     @name = name
#   end

#   def get_age(num)
#     @age = num
#   end
# end

# class Adult < Person

#   def initialize(name, address)
#     super(name)
#     @address = address
#   end
# end

# adult = Adult.new("Tim", "123 Sesame St")
# person = Person.new("Tina")
# person.get_age(32)
# p adult.age
# p adult
# p person

# Instance methods vs. class methods

# class Person
#   @@number_of_people = 0

#   def initialize
#     @@number_of_people += 1
#   end

#   def self.number_of_people
#     @@number_of_people
#   end

#   def self.say
#     "I'm a #{self} and what I say goes."
#   end

#   def speak
#     puts "Hey, I'm a #{self.class}" # self references an instance of the class, the calling obj
#   end
# end

# person = Person.new
# person2 = Person.new
# p Person.number_of_people

# #person.say
# # p Person.speak

# class Lumberjack
#   @@locations = []

#   def initialize(name, location)
#     @name = name
#     @location = location
#     Lumberjack.add_location(location)
#   end

#   def self.locations
#     @@locations
#   end

#   def self.add_location(location)
#     locations << location
#   end
# end

# pete = Lumberjack.new("Pete", "Kodiak")
# p Lumberjack.locations
# rosa = Lumberjack.new("Rosa", "LA")
# amy = Lumberjack.new("Amy", "Livingston")
# p Lumberjack.locations

# Method Access Control
  # - private -> not at all available to other isntance of the class
  # - protected -> methods available to other instance of the class and subclasses, inside the class definition
  # - public -> available to all isntance of the class through public interface

  class Animal

    def speak
      "I speak"
    end

    def to_call_walk
      walk
    end

    protected

    def walk
      puts "I walk"
    end
  end

  class Dog < Animal
    def speak
      "wuf, wuf!"
    end
  end

  # #p Dog.instance_methods
  # p Animal.instance_methods
  # puts "\n"
  # p Dog.instance_methods
  # dog = Dog.new
  # dog.to_call_walk

  #################

  class Animal

    def initialize(name)
      @name = name
    end

    def name=(name)
      @name = name
    end

    def speak
      "I speak"
    end

    def to_call_walk(other)
      walk(other)
    end

    private

    def walk(other)
      self.name = other
    end
  end

  class Dog < Animal
    def speak
      "wuf, wuf!"
    end
  end

  #p Dog.instance_methods
  parrot = Animal.new("Funky")
  parrot.to_call_walk("Chewy")
  # p parrot

  # https://launchschool.com/exercises/d0f9783f


  # protected methods can't be accessed directly via public iterface, but they can be accessed from within a public method in the class definition by the instance of the object, or instances of its subclasses.

  # Protected methods are those that are available within the class as opposed to only being available within an instance of the class. For practical purposes, this means that they can be invoked by all objects within a certain class, but only from within the class.

  # This differs from private methods in that a private method can only be called by the singular instance within the class. We can use protected methods to compare objects of a particular class, which is their most common use.

  # https://github.com/gcpinckert/rb120_rb129/blob/main/study_guide/method_access_control.md

  # Referencing and setting instance variables vs. using getters and setters

  # - Referencing - instance variables
  # - setting - instance variables
  # - VS. Getters
  # - Setters

  # class CoffeeShop
  #   def initialize(name)
  #     self.name = name
  #   end

  #   def name=(other)
  #   end

  #   def name
  #     @name.capitalize
  #   end

  #   # def name
  #   #   @name
  #   # end
  # end

  # def salary(amnt) #2000 on their anual salary
  #   @amnt = amnt
  #   # perform calcs to take taxes
  # end

  # class Ticket
  #   attr_reader :venue, :date, :price

  #   def initialize(venue, date, price)
  #     @venue = venue
  #     @date = date
  #     @price = price
  #   end

  # def
  #   print "What do you want to know?"
  #     io = gets.chomp.to_sym
  #     # p concert.send(io)
  #     if self.send(io) # venue
  #       puts self.send(io)
  #     else
  #       puts "Info not found"
  #     end
  # end



  # concert = Ticket.new("Hollywood Bowl", " Dec. 12, 2023","$100")


  # print "What do you want to know?"
  #   io = gets.chomp.to_sym
  #   # p concert.send(io)
  #   if concert.send(io) # venue
  #     puts concert.send(io)
  #   else
  #     puts "Info not found"
  #   end


  # starbucks = CoffeeShop.new("Starbucks")
  # p starbucks #.name

  # Class inheritance, encapsulation, and polymorphism
  class Student
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def learn
    end
  end

  amy = Student.new('Amy')
  rosa = Student.new('Rosa')

  p amy.name
  p rosa.name
  # every instance has its own state and they don't share

  class Teacher
    def initialize(name)
      @name = name
    end

    def teach
    end
  end

  # Polymorphism

  # 1. Inheritance
      # a. class inheritance
      # b. interface inheritance
  # 2. Duck Typing - intnetion behind code would be to treat them the same.  There isn't any doubt to treat the objects in a different way.

  class Person
    def quack
      p "I can quack like a duck. Quack!"
    end
  end

  # https://otta.com/

  # class Duck
  #   def quack
  #     p "Quack! Quack! Cuac!"
  #   end
  # end

  # [Person.new, Duck.new].each do |obj|
  #   obj.quack
  # end


  class Human
    def rant
    end
  end

  class Mother < Human
    def rant
    end
  end

  class Child < Mother
    def rant
    end
  end


  # Modules

  # 3 uses of modules:
  # 1. Namespacing
  # 2. Mixins
  # 3. Modules as a Container for methods that don't fit elsewhere.

  # https://github.com/gcpinckert/rb120_rb129/blob/main/study_guide/modules.md

  # Method lookup path
  # starts with enclosing structure (class) -> mixins -> superclass -> Ruby native classes
  # lookup path is the same as the ancestors

  # class Person
  #   def walk
  #     true
  #   end
  #   def cry
  #     "wahaaaa"
  #   end
  # end

  # class Baby < Person
  #   def walk
  #     false
  #   end
  # end

  # bby = Baby.new
  # p bby.walk
  # p bby.cry
  # p Baby.ancestors

  # self
  # class Person
  #   p self

  #   def self.class_method
  #     "I am #{self} hear me roar!" # accessing class directly
  #   end

  #   def instance_method
  #     "I am #{self.class} and I love this game!" # retrieving the class from an instance
  #   end
  # end

  # p Person.class_method
  # p Person.new.instance_method

  # Calling methods with self
  class Car
    attr_accessor :brand

    def initialize(brand)
      @brand = brand
    end
  end

  car1 = Car.new('Ford')
  car1.brand = "Chevy"
  p car1
  # More about self
  # Reading OO code
  # Fake operators and equality
  # BasicObject#==
    # - checks whether two objects are litereally the same object
    # String#== --> do they contain the same value
  # Working with collaborator objects


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

    def ==(other)
      latitude == other.latitude && longitude == other.longitude
    end

    def to_s
      "(#{latitude}, #{longitude})"
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

  class Person
    def initialize(name)
      @name = name
    end
  end

  class Cat
    def initialize(name, owner)
      @name = name
      @owner = owner
    end
  end

  sara = Person.new("Sara")
  fluffy = Cat.new("Fluffy", sara)
  # Identify all custom defined objects that act as collaborator objects within the code.
