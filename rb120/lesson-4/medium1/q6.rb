# If we have these two methods in the Computer class:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and 

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

# what is the difference in the way the code works?

# S: 
# using the self prepended to template references the getter method created by the attr_accessor 
# using just template like in the first example is the same, it's an implied self. Since this is
# only the getter method, the self doesnt actually need to be there 
# if it were a setter method, then we'd need the self 