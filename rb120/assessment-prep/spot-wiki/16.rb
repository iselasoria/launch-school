# Why is it generally safer to invoke a setter method (if available) vs. referencing
# the instance variable directly when
# trying to set an instance variable within the class? Give an example.

# It's is better to use the setter method because this allows for more flexibility in our code. The benefit is more obvious on larger
# codebases spanning thousands of lines of code. Being able to change one thing-- the setter method-- makes implementing changes easier
# than having to change every single time where the instance variable appears.

class Salary

  def initialize(name, gross_income)
    @name = name
    @gross_income = gross_income
  end

end

joe = Salary.new('Joe Goldberg', 2000)
p joe