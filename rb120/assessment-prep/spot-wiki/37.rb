# When should we use class inheritance vs. interface inheritance?

# class inheritance
  # Ruby only inherits from a single class
  # is-a relationship

# interface inheritance
  # Ruby's implementation for multiple inheritance


# We should use class inheritance when we want to create a specialized version of a class. This represents an "is a" relationship.

# We should use interface inheritance to include a group of organized behaviors into a class. This represents a "has a" relationship. In ruby, we implement interface inheritance by including modules into classes via mixins.

# For example a human is an animal and has the ability to walk. Therefore it makes sense for to create a Human subclass of Animal with an included Walkable module.