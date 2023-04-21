A form of [[polymorphism]], duck typing just means _if it quacks like a duck, treat it like a duck_.
This means that polymorphism allows different objects to respond to a common interface-- a common method. In polymorphism, we don't care what type of object is responding, all we care is that in does, in fact, respond.  A important quality of polymorphism is that the code must also explicitly show intention either by forcing different objects to respond to a common method, or by design. Let's look at an example. 

The example below is a prompt for a [[spike]] and it lives in this [code sample](../sample-code/spike-dentist-office.md).

```ruby
dental_people_inc.staff.each {|person| person.work}
```
  
As we can see, we have a list of staff (each with different responsibilities) and they are all responding to the `work` instance method. Each one is responding differently based on their own class behaviors, but responding nonetheless. 

If we didn't have an explicit use like the snippet above, we can still have polymorphism by design. In the code below, the classes were constructed to respond to a common interface
```ruby
class HairStylist
	def work
		"I cut and style hair."
	end
end

class Manicurist
	def work
		"I specialize in Russian manicures."
	end
end

class MakeUpArtist
	def work
		"I specialize in make-up."
	end
end



kathy = HairStylist.new
p kathy.work

anna = Manicurist.new
p anna.work

fran = MakeUpArtist.new
p fran.work

```
