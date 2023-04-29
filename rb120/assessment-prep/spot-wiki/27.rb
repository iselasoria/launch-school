# How does encapsulation relate to the public interface of a class?

# Encapsulation prevents certain parts of the code from being exposed to the public interface.

class LaunchSchool

  attr_reader :instructor # if we didm't have this reader method, we couldn't access instructor from outside

  def initialize(instructor)
    @instructor = instructor
  end
end

chris = LaunchSchool.new("Chris")
p chris
p chris.instructor