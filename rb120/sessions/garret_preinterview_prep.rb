### Classes and objects

**Classes**

We can think of classes as cookie cutters to objects. The class (or cookie cutter) is a template for the object. Classes define behavior that will eventually be available to the objects that will be instantiated from them. A class also determines the known attributes the objects will have.

A class definition looks like this:

```ruby
class Panthera
  def initialize(genus)
    @genus = genus
  end
end
```

**Objects**

On the other hand, objects are the cookies that were made with the cookie cutter-- the class. We say that objects are instance of the class from which they were instantiated. Objects have access to the behavior defined in the classes from which they were instantiated. Objects have the ability to then define their _own_ invividual attributes. So in the example above, with the class `Panthera`, each object that gets instantiated from that class has the ability to have its own genus defined. This shows objects encapsulate state.

```ruby
tiger = Panthera.new('Tigris')
snowleopard = Panthera.new('Uncia')
p tiger #<Panthera:0x00007f764a749600 @genus="Tigris">
p snowleopard #<Panthera:0x00007f764a749560 @genus="Uncia">
```

### Use attr_* to create setter and getter methods
Because objects encapsulate state, the attributes (which are specific to the instance of the class), are innaccessible from the outside. Continuing with the example above, the following would not work:
```ruby
snowleopard.genus # NoMethodError: undefined method `genus' for #<Panthera:0x00007fbe9b3c9680 @genus="Uncia">
```
The great thing about objects, is they hide certain pieces of code from other parts of the codebase or from the outside interface. This is why we must be intentional about how we disclose pieces of code. That's where attribute readers and setters come in. Since the attributes are state that is encapsulated in objects, we have to intentionally disclose some of that state. We can do this in a read-only manner via a `getter method` also refered to as `attr_reader`. A getter method will retrieve the value stored in the instance variable. If we want to be able to set or update the value stored, we need an attribute writer, or `setter method` also refered to as `attr_writer` which allows updates from the outside interface.

Getter/setter methods, by convention, have the name of the instance variable they will retrive or modify. So a setter method for the exmaple above would look like this:

```ruby
#...code ommited
  def genus
    @genus = genus
  end
```
or we could use the short-hand `attr_reader` and pass the name of the instance variable as a symbol to end up with:

```ruby
attr_reader :genus
```

Similarly, a setter method would look like this:
```ruby
attr_writer :genus
```
or
```ruby
#...code ommitted
def genus=(new_genus)
  @genus = new_genus
end
```

### How to call setters and getters
Because getter/setter methods are instance methods, they get called on instances of the class. Continuing with the above example:

```ruby
class Panthera
  attr_writer :genus

  def initialize(genus)
    @genus = genus
  end
end

tiger = Panthera.new('Tigris')
snowleopard = Panthera.new('Uncia')
tiger.genus='Tony the Tiger'
p tiger #<Panthera:0x00007f8abab81540 @genus="Tony the Tiger">
```

### Instance variables, class variables, and constants, including the scope of each type and how inheritance can affect that scope

**Instance Variables**
- Definition

  Instance variables are defined in the class definition and by default, uninitialized instance variables or _ivars_ have a value of `nil`.
  Instance variables become attributes when a value is set for them and the state of an object is comprised of the instance variables and their values. Instance variables are never inherited, sometimes getters/setters might make it seem like _ivars_ are inherited but really what we are inheriting in those cases is the getter/setter itself. Since _ivars_ encapsulate state, they are individual to each object-- never inherited and never shared.

  If we have an inheritance chain from a superclass to a subclass, we might be inheriting a constructor method-- the initialize, and then it might seem like we inherit _ivars_ but we are only inheriting the behavior that sets them-- the constructor.

```ruby
class Felidae
  def define_kingdom
    @kingdom = 'Animalia'
  end
end

class Panthera < Felidae
  attr_writer :genus

  def initialize(genus)
    @genus = genus
  end
end

snowleopard = Panthera.new('Uncia')
p snowleopard #<Panthera:0x00007fa9f9f410a0 @genus="Uncia">
snowleopard.define_kingdom
p snowleopard #<Panthera:0x00007fa9f9f410a0 @genus="Uncia", @kingdom="Animalia">
```
In the code above, we inheirit

- Scope
- Inheritance

**Class Variables**
- Definition
- Scope
- Inheritance

**Constants**
- Definition
- Scope
- Inheritance



### Instance methods vs. class methods


### Method Access Control

### Referencing and setting instance variables vs. using getters and setters

### Class inheritance, encapsulation, and polymorphism

### Modules

### Method lookup path

### self

### Calling methods with self

### More about self

### Reading OO code

### Fake operators and equality

### Working with collaborator objects
Collaborator objects are object that make up part of the state of another object. They are

### Create a code spike

