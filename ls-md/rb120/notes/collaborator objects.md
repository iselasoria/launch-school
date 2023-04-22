Collaborator objects have a `has_a` relationship, but not in the way that model mixins do. Instead, their `has_a` relationship refers more to possession as in one thing that _has_ another.

For example:
	A library has books.
	A school has students.
	A fire department has firefighters.
	
You get the idea.

So collaborator objects are object that make up part of the state of another object. For example:
```ruby
class SchoolOffice
attr_reader :staff

	def initialize
		@staff = []
		staff << Principal.new
		staff << Nurse.new
		4.times {staff << Counselor.new}
	end
end

class Principal; end

class Counselor; end

class Nurse; end

  

pacifica_high_school = SchoolOffice.new

p pacifica_high_school #<SchoolOffice:0x00007fe9626d0dc8 @staff=[#<Principal:0x00007fe9626d0be8>, #<Nurse:0x00007fe9626d0af8>, #<Counselor:0x00007fe9626d0940>, #<Counselor:0x00007fe9626d0878>, #<Counselor:0x00007fe9626d0850>, #<Counselor:0x00007fe9626d0828>]>

```
In the code above, we can see the state of the `SchoolOffice` object contains instances of the `Principal`, `Nurse` and `Counselor` objects. These objects are collaborators to the instance of `SchoolOffice`. 
