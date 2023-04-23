class AnimalClass
  attr_accessor :name, :animals

  def initialize(name)
    @name = name
    @animals = []
  end

  def <<(animal)
    animals << animal
  end

  # def +(other_class)
  #   animals + other_class.animals
  # end
  def +(other_class)
    temp_class = AnimalClass.new('Mammals and Birds')
    temp_class.animals = animals + other_class.animals
    temp_class
  end
end

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

# p mammals
# p birds

some_animal_classes = mammals + birds

p some_animal_classes


# What is output? Is this what we would expect when using `AnimalClass#+`?
# If not, how could we adjust the implementation of `AnimalClass#+` to be
# more in line with what we'd expect the method to return?

# S:
# the output is an array object containing all the instances of Animal that were instantiated.
# The implementation of AnimalClass#+ was accessing the array objects containing the various instances of
# the Animal class. This is unexpected behavior because if we add two objects of the same class it makes
# more sense that we should get back an object of the same class. So in order to have the `AnimalClass#+`
# method return an object of the same class we need to change the implementation to a new class and then set that class's
# animals array to the animals from the two instances we are trying to add.
