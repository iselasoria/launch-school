Polymorphism is implemented in Ruby in one of two ways, via [[duck-typing ]]or through [[inheritance]]. When we have a super class that passes down methods to its subclasses and we let a subclass make use of those methods defined outside its boundaries, we are implementing polymorphism. 


```ruby
class HairStylist
	def work
		"I work at the hair salon"
	end
end

class ColorSpecialist < HairStylist
	def work
		"I specialize in color"
	end
end

class PermSpecialist < HairStylist
	def work
		"I specialize in perms"
	end
end

class GeneralCutStylist < HairStylist
	def work
		"I moslty cut hair"
	end
end


class Apprentince < HairStylist
end

  
kathy = PermSpecialist.new
p kathy.work

anna = ColorSpecialist.new
p anna.work
```
In the code above, we see that the `Apprentice` class uses the `work` method that given to it by `HairStylist`. 
tags: #major 