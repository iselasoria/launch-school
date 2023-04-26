# Give an example of when it would make sense
# to manually write a custom getter method vs. using `attr_reader`.

=begin
It makes sense to write a custom getter method when we want to extend the duncitonality of the getter.
# For instance, if we want to be able to do something to the value of the instance variable, before we retrieve it.
=end

class Salary

  def initialize(name, gross_income)
    @name = name
    @gross_income = gross_income
  end

  def gross_income
    @gross_income * 0.72
  end

end

joe = Salary.new('Joe Goldberg', 2000)
p joe
p joe.gross_income