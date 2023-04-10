=begin
Below we have 3 classes: Student, Graduate, and Undergraduate.
The implementation details for the #initialize methods in Graduate and Undergraduate are missing.
Fill in those missing details so that the following requirements are fulfilled:

Graduate students have the option to use on-campus parking, while Undergraduate students do not.

Graduate and Undergraduate students both have a name and year associated with them.

Note, you can do this by adding or altering no more than 5 lines of code.

=end

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year) # make use of the super class initialize method here
    @parking = parking # extend the super initialzie method by adding parking for this subclass only
  end
end

class Undergraduate < Student
  def initialize(name, year) # this whole method can be ommited since it does the same as the Student initialize that it inheritted
    super
  end
end

