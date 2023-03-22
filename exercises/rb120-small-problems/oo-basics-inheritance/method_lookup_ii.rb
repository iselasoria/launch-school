=begin 
Using the following code, determine the lookup path used when invoking cat1.color. 
Only list the classes and modules that Ruby will check when searching
for the #color method.
=end 

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

# Cat -> Animal -> Object -> Kernel -> BasicObject
# when the method is not anywhere, the result includes 
# every class and module in the search path-- it looked everywhere before giving up