=begin
* DONE 2m31s

Take a look:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

The outputs: Alice
             Bob
        
Now: 
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

Can you explain what this outputs and print the result?


In this second snippet of code, both variables output 'BOB.'
On line 15, a variable is initialized to point to string object 'Bob', then a new variable is 
initialzied and it also points to that samew object refereced by variable name.
In the next line, we mutate the object with a mutating method so now name points to the updated 'BOB'
and since save_name was pointing to that object, it also became mutated to 'BOB'---> not a new object, it is the same one.

=end