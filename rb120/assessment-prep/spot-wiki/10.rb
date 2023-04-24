# TODO Review
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  include Climbable

  class GoodDog < Animal
    include Swimmable
    include Danceable
  end

  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
p good_dog.walk


# What is the method lookup path used when invoking `#walk` on `good_dog`?
# In Ruby, methods are resolved first withing the calling structure, then moduels (orer from alt to first), then super class, and
# lastly, all the remaining superclasses pre-defined such as Object, BasicObject, etc
# So in this case, the way the classes are namespaced, tells us that in order to resolve the method 'walk' Ruby would
# first look in the namespaced GoodDog class from inside the GoodAnimals module, then danceable, swimmable, then Animal superclass,
# The in the Animal superclass, we find walkable so it would look there next, and then move on to the Object, BasicObject.

