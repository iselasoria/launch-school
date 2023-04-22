Encapsulation is the act of hiding some portions of the program from the external interface. Encapsulation is essentially being intentional about what code we expose to the rest of the codebase. As a rule of thumb, we should have as little public code as possible because this protects data from being changed unintentionally. Segregating the [[instance]] variables and behaviors through encapsulation makes the code more reusable because if other parts of the code don't _know_ about the intricacies of the implementation of a given method, they just know to respond to it, then if changes happen in the implementation the methods that interact with an encapsulated object will likely continue to work despite changes. 

Objects encapsulate [[state]]. Objects of the same class are only aware of themselves and their current state, not of objects outside even if they are of the same class. This is to say that the state of the class (the instance variables and their values) are scoped at the [[object]] level.

One way we achieve encapsulation is via [[method access control]] also known as [[access modifiers]].

```ruby 
class GoldenGirls

	def initialize(name, age)
		@name = name
		@age = age
	end

	def meet_handsome_bachelor
		case name
		when 'Blanche Deveraux'
			"Hi, I'm #{name}, I just turned #{age - 15}."
		when 'Rose Nylund'
			"I'm #{name}, I'm from Saint Olaf and I'm #{age}."
		when 'Dorothy Zbornak'
			"Hi, I'm #{name}, I'm #{age}."
		end
	end

	private
	
	attr_accessor :name, :age
end

  

blanche = GoldenGirls.new("Blanche Deveraux", 53)
rose = GoldenGirls.new("Rose Nylund", 51)
dorothy = GoldenGirls.new("Blanche Deveraux", 55)

p blanche.meet_handsome_bachelor # "Hi, I'm Blanche Deveraux, I just turned 38."
p rose.meet_handsome_bachelor #"I'm Rose Nylund, I'm from Saint Olaf and I'm 51."
p dorothy.meet_handsome_bachelor # "Hi, I'm Dorothy Zbornak, I'm 55."
```
In the code above, we don't have access to obtain the information on the Girls' ages, that information only is given when they meet a handsome bachelor. The behavior is decided by each girl, each [[instance]] of the `Golden Girls` class and as outsiders we have no real knowledge of how they answer that question-- Blanch is a liar, but that's okay because her age is private and she can behave/implement her response however she wants and we shouldn't care, as long as we receive an answer. 