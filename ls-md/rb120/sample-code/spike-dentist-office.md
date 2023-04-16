###Dental Office Alumni (by Rona Hsu)

There's a dental office called Dental People Inc. Within this office, there's 2 oral surgeons, 2 orthodontists, 1 general dentist. Both general dentists and oral surgeons can pull teeth. Orthodontists cannot pull teeth. Orthodontists straighten teeth. All of these aforementioned specialties are dentists. All dentists graduated from dental school. Oral surgeons place implants. General dentists fill teeth
```
Now let's look at the verbs and nouns present so we can begin to think about classes and instance variables:
```markdown
**NOUNS:

Proper Nouns:
- Dental Office
- Dentists:
- Oral Surgeons
- Orthodontists
- General dentist

Common Nouns:
- teeth
- implants
--- 

**VERBS:
- pull
- straighten
- graduated
- place implants
- fill teeth
```
Now, let's start to visualize the structure of the classes and their instance variables:
```markdown
Dentists
- graduates from dental school

Oral Surgeons
- pull teeth
- place implants

Orthodontists
- straighten teeth

General dentist
- pull teeth
- fill teeth
```

Now let's write it in code:
```ruby
module Pullable
	def pull
		puts "I'm a #{self.class} and I can pull teeth"
	end
end

  
class DentalOffice

	attr_reader :staff
	
	def initialize
		@staff = []
		2.times {staff << OralSurgeon.new}
		2.times {staff << Orthodontist.new}
		staff << GeneralDentist.new
	end
end

  

class Dentist

	def work
	end
	
	def graduate
		puts "I gradauted from dental school"
	end
end

  

class OralSurgeon < Dentist

include Pullable

	def work
		pull
	end

end

  

class Orthodontist < Dentist

	def work
		straighten
	end

	def straighten
		puts "I'm a #{self.class} and I straighten teeth"
	end
end

  

class GeneralDentist < Dentist

include Pullable

	def work
		pull
		fill
	end
	
	def fill
		puts "I'm a #{self.class} and I can fill teeth"
	end
end

  

dental_people_inc = DentalOffice.new

dental_people_inc.staff.each {|person| person.work}
```

