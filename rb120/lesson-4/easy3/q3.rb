=begin 
When objects are created they are a separate realization of a particular class.

Given the class below, how do we create two different instances of this class with separate names and ages?

=end 

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# S: 
# we call the new keyword on the class and pass it two parameters for age and name with each instantiation
# new triggers the constructor initialize and that is how the objects are created 
toby = AngryCat.new(3, "Toby")
mittens = AngryCat.new(2, "Mittens")
