class Student
  attr_accessor :grade

  def initialize(name, grade=nil)
    @name = name
    # @grade = grade
  end
end

ade = Student.new('Adewale')
p ade # => #<Student:0x00000002a88ef8 @grade=nil, @name="Adewale">

# the reason the code does not output the state expected is that we
# nver iniitialzed the @grade ivar. Definint seters/getters does not
# give us access to the instance variables. The fix would be to
# initialize the ivar on line 6