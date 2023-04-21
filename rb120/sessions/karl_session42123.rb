# Intros
# RB129 Assessment
# - Assessment Format
# - Preparing for the Assessment
# Example questions
# - Conceptual Questions
# - Code-based questions
# Any other questions

class Person
  def move
    "I walk"
  end
end

class Vehicle
  def move
    "I'm moving"
  end
end

class Car < Vehicle
  def move
    "80mph"
  end
end

class Airplane < Vehicle
  def move
    "200mph"
  end
end

class Carriage < Vehicle # this relies on the move inherited from Vehicle
end

arr = [Person.new, Car.new, Airpla.new]

arr.each do |item|
  item.move
end

