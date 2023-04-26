# What are collaborator objects, and what is the purpose of using them in OOP?
# Give an example of how we would work with one.

# Collaborator objects are objects that make up part of the state of another object
# they have a has-a relationship as in: a hospital has a surgeon, has a nurse, etc
# One reason to b e cautious when using them is they introduce dependecies-- if a class
# knows about the existance of anotherm and is expeting to interact with another class by accepting
# collaborator objects, that can tightly couple the dependency between the two classes making
# future changes more burdensome.
# the benefit of collaborator objects is you can delegate responsibilities to another class

class BaskinRobins
  def inititialize(*flavors)
    @flavors = flavors
  end
end

class RockyRoad; end
class Vanilla; end
class Chocolate; end

br = BaskinRobins.new(RockyRoad.new, Vanilla.new, Chocolate.new)