class Passenger
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def sing(name)
    "what a wonderful worlddd"
    @name = name
    speak
  end
  
  private
  
  def name=(name)
    @name = name
  end

  def speak
    "and i think to myself"
  end 
end




linda = Passenger.new('Linda')
p linda.sing('Joanne')
# p linda.speak('Joanne')
# p linda.name = 'Joanne'
# # p linda.speak

# p Passenger.sing

# this will not work
# class Student
#   attr_reader :name

#   def initialize(name, id)
#     @name = name
#     @id = id
#   end

#   def ==(other_student)
#     id == other_student.id  # #id is private so cannot be called by another instance
#   end

#   private
#   attr_reader :id
# end

# jill1 = Student.new('Jill', 12345)
# jill2 = Student.new('Jill', 67890)
# jill1 == jill2                        # => NoMethodError: private method `id'...

# # this will work
# class Student
#   attr_reader :name

#   def initialize(name, id)
#     @name = name
#     @id = id
#   end

#   def ==(other_student)
#     id == other_student.id  # protected methods can be called on other instances
#   end

#   protected
#   attr_reader :id
# end

# jill1 = Student.new('Jill', 12345)
# jill2 = Student.new('Jill', 67890)
# jill1 == jill2              # false
# jill1 == jill1              # true


# The difference between the two snippets is that in the first one, the id attribute is defined as a private method using attr_reader, while in the second one it is defined as a protected method.

# In Ruby, private methods can only be called within the context of the current object. This means that in the first snippet, when the == method tries to call other_student.id, it raises a NoMethodError because id is a private method and cannot be called on another instance of the Student class.

# On the other hand, protected methods can be called by any instance of the defining class or its subclasses. This means that in the second snippet, when the == method calls other_student.id, it works because id is now a protected method and can be called on another instance of the Student class.

# So, in summary, the first snippet doesn’t work because it tries to call a private method on another instance of the class, while the second snippet works because it calls a protected method on another instance of the class.