# How do you find where ruby will look for a method when that method is called? 
# How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# What is the object lookup chain for Orange and HotSauce? 

# S:
# asking the class itself what it's ancestors are will tell us
# ancestors is a class method 
p HotSauce.ancestors
# [HotSauce, Taste, Object, Kernel, BasicObject]
