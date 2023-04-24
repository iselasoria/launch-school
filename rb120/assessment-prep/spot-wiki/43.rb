class Student
  attr_accessor :name, :grade

  def initialize(name)
    @name = name
    @grade = nil
  end

  def change_grade(new_grade)
    self.grade = new_grade
  end
end

priya = Student.new("Priya")
priya.change_grade('A')
p priya.grade




# In the above code snippet, we want to return `”A”`.
# What is actually returned and why? How could we adjust the code to
# produce the desired result?

# this code outputs nil because that is the default value assinged on line 6.
# then, when we invoke the change_grade method, if we look closer at
# the implementation we notice that `grade` is a local variable, and therefore
# it is not updating the value of the instance variable grade. The solution is to
# append self-- this way we are making use of the setter method for that ivar.