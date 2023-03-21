=begin 

Given the following code:

bob = Person.new
bob.hi

and this error message:

NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

What is the problem and how do you fix it?
Hi is a private method and remains "hidden" from the object. We can fix this by moving the 
method above the private method call, since anything below it will be private to the object.