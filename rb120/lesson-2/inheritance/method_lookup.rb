# What is the method lookup path amd why is it important?

=begin 
The method lookup path is the linear way in which Ruby looks for methods 
in ineritance. If we call a method, Ruby will first look in the class
  pertaining to that object, if it doesn't find it it will then search in the 
parent class/superclass, if it doesn't find it, it will look in modules and then in the 
default classes that Ruby passes down behavior from like the Object class. If the 
method is not found anywhere in the chain, it will return an error. This is important because we want to know
at all times which methods we might be overriding. 
The chain looks like this:

singleton method -> Class -> Modules using inlcude -> Parent Class -> BasicObject