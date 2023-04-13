[[Object Oriented Programming]]

Objects encapsulate [[state]]. They are instances of the class that was used to create them and have access to their class' instance methods. However, they do _not_ share state with any other instance of the same class. 

If a class were a cookie cutter, the object would be the cookie used to make it. 

### What is shared amongst objects of the same class?
Objects instantiated from the same class all have access to the behaviors defined by that class, this includes [[getter]] and [[setter]] methods. However, they do **not** share instance variables. 

Additionally, objects of the same class also share [[class variables]], which have [[scope]] at the class level. Instances of a class have access to the same value so overriding affects all instances. 

