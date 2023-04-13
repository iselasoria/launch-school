### Object's relationship to [[attributes]]
An attribute is an instance variable and its value. Attributes are accessible from outside the method that defined them via a [[getter]] and/or [[setter]] methods also known as [[accessor methods]].
Attributes make up the state of the object and since we know objects don't share state, we know attributes are not actually inherited, only their accessor methods to set and/or retrieve them are. 
When we define getter/setter methods for an instance variable we are making it an attribute of the object. 