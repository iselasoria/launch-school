### Classes and objects

**Classes**

We can think of classes as cookie cutters to objects. The class (or cookie cutter) is a template for the object. Classes define behavior that will eventually be available to the objects that will be instantiated from them. A class also determines the known attributes the objects will have.

A class definition looks like this:

```ruby
class Panthera
  def initialize(species)
    @species = species
  end
end
```

**Objects**

On the other hand, objects are the cookies that were made with the cookie cutter-- the class. We say that objects are instance of the class from which they were instantiated. Objects have access to the behavior defined in the classes from which they were instantiated. Objects have the ability to then define their _own_ invividual attributes. So in the example above, with the class `Panthera`, each object that gets instantiated from that class has the ability to have its own species defined. This shows objects encapsulate state.

```ruby
tiger = Panthera.new('Tigris')
snowleopard = Panthera.new('Uncia')
p tiger #<Panthera:0x00007f764a749600 @species="Tigris">
p snowleopard #<Panthera:0x00007f764a749560 @species="Uncia">
```

### Use attr_* to create setter and getter methods
Because objects encapsulate state, the attributes (which are specific to the instance of the class), are innaccessible from the outside. Continuing with the example above, the following would not work:
```ruby
snowleopard.species # NoMethodError: undefined method `species' for #<Panthera:0x00007fbe9b3c9680 @species="Uncia">
```
The great thing about objects, is they hide certain pieces of code from other parts of the codebase or from the outside interface. This is why we must be intentional about how we disclose pieces of code. That's where attribute readers and setters come in. Since the attributes are state that is encapsulated in objects, we have to intentionally disclose some of that state. We can do this in a read-only manner via a `getter method` also refered to as `attr_reader`. A getter method will retrieve the value stored in the instance variable. If we want to be able to set or update the value stored, we need an attribute writer, or `setter method` also refered to as `attr_writer` which allows updates from the outside interface.

Getter/setter methods, by convention, have the name of the instance variable they will retrive or modify. So a setter method for the exmaple above would look like this:

```ruby
#...code ommited
  def species
    @species = species
  end
```
or we could use the short-hand `attr_reader` and pass the name of the instance variable as a symbol to end up with:

```ruby
attr_reader :species
```

Similarly, a setter method would look like this:
```ruby
attr_writer :species
```
or
```ruby
#...code ommitted
def species=(new_species)
  @species = new_species
end
```

### How to call setters and getters
Because getter/setter methods are instance methods, they get called on instances of the class. Continuing with the above example:

```ruby
class Panthera
  attr_writer :species

  def initialize(species)
    @species = species
  end
end

tiger = Panthera.new('Tigris')
snowleopard = Panthera.new('Uncia')
tiger.species='Tony the Tiger'
p tiger #<Panthera:0x00007f8abab81540 @species="Tony the Tiger">
```

### Instance variables, class variables, and constants, including the scope of each type and how inheritance can affect that scope

**Instance Variables**
- Definition

  Instance variables are defined in the class definition and by default, uninitialized instance variables or _ivars_ have a value of `nil`.
  Instance variables become attributes when a value is set for them and the state of an object is comprised of the instance variables and their values.
In ither words, _ivars_ is how we tie data to objects.
One main difference between instance variables and local variables is the scope.
- Scope

  Instance variables are scoped to the object. Each instance of a class has its own individual set of _ivars._ An instance variable lives on as long as the object lives, unlike local variables which die with the method that defines them.

- Inheritance

  Instance variables are never inherited, sometimes getters/setters might make it seem like ivars are inherited but really what we are inheriting in those cases is the getter/setter itself. Since _ivars_ encapsulate state, they are individual to each object-- never inherited and never shared.

  If we have an inheritance chain from a superclass to a subclass, we might be inheriting a constructor method-- the initialize, and then it might seem like we inherit ivars but we are only inheriting the behavior that sets them-- the constructor.

```ruby
class Felidae
  def define_kingdom
    @kingdom = 'Animalia'
  end
end

class Panthera < Felidae
  attr_writer :species

  def initialize(species)
    @species = species
  end
end

snowleopard = Panthera.new('Uncia')
p snowleopard #<Panthera:0x00007fa9f9f410a0 @species="Uncia">
snowleopard.define_kingdom
p snowleopard #<Panthera:0x00007fa9f9f410a0 @species="Uncia", @kingdom="Animalia">
```
In the code above, we inheirit the `define_kingdon` instance method, a behavior which defines an instance variable. But as we can see, the instance variable `@kingdom` is not found in the state of `snowleopard` until after the method inherited is called.


**Class Variables**
- Definition
  Class variables are denoted with a double `@` so they look like this `@@memberships_sold`. Unlike instance variables, class variables _ARE_ are shared amongst all instanced of the class and its subclasses. This is the reason they are quite dangerous, carelessness can lead to unexpected results. Take the following example:

  ```ruby
  class Felidae
    def define_kingdom
      @kingdom = 'Animalia'
    end
  end

  class Panthera < Felidae
    @@pop_count = 6500

    def self.pop_count
        @@pop_count
    end

    attr_writer :species

    def initialize(species)
      @species = species
    end
  end

  class Onca < Panthera # Mayan God of war
    def initialize(mayan_name)
      @mayan_name = mayan_name
    end
  end

  snowleopard = Panthera.new('Uncia')
  tiger = Panthera.new('Tigris')
  ek_balam = Onca.new('Ek Balam')

  p snowleopard.class.pop_count #6500
  p tiger.class.pop_count #6500
  p ek_balam.class.pop_count #6500
  ```
  - Scope and Inheritance
As seen in the code above, every single instance has access to the `6500` population count. The two instances of the `Panthera` class share that number, and the instance of the subclass that inherits from `Panthera` also shares that class variable. As we can see the scope extends wide.

**Constants**
- Definition
  Constants as the name suggests, are variables that do not change. By convention, constants are written in all capital letters:

  ```ruby
  KEYS = 'Spare Car Keys'
  ```
- Scope and Inheritance

Constants are scoped lexically in Ruby. This means that when a constant is called, Ruby will first look in the enclosing structure, then up the parent structure, then top level scope until it can resolve the constants, but there are some intricacies.

> NOTE: In the subsequent code, we are searching for our _**Car Keys**_

| Locations where `KEYS is defined  | Value Resolved to|
| :-------------------------------: |:----------------:|
| `Garage` class                    | `Safe Keys`      |
| `OldKeys` module                  | `Old Car Keys`   |
| `FriendHouse` module              | `Car Keys`       |
| `House` class                     | `House Keys`     |
| `FriendHouse` module              | `Car Keys`       |
| top-level                         | `Toy Keys`       |
In this example, Ruby will search and find the `keys` constant in the enclosing structure, so it will stop looking:



```ruby
KEYS = 'Toy Keys'

module OldKeys
  KEYS = 'Old Car Keys'
end

module FriendHouse
  KEYS = 'Car Keys'
end

class House
  KEYS = 'House Keys'
end

class Livingroom < House

end

class Garage < House
  include FriendHouse
  include OldKeys

  # KEYS = 'Safe Keys'

  def search_for_keys
    KEYS
  end
end


garage = Garage.new
p garage.search_for_keys
```

In the code above, the call to resolve the `KEYS` constant comes from inside the `search_for_keys` instance methodm which is accessible to the instances of the `garage` class. This means Ruby will first search the enclosing structure, in this case the `Garage` class definition. It will find the constant defined with the value `Safe Keys` and it will stop searching.

If we comment out the `KEYS` definition in the enclosing structure, we for Ruby to travel up the inheritance chain starting with modules. Once in modules, Ruby will search first in the last module added, in this case the `OldKeys` module and will resolve the constant as `Old Car Keys`.

If now we also comment the constant definition in the OldKeys module, Ruby will conttinue traveling up the inheritance chain and on to the next module, the `FriendHouse` module where it will find `Car Keys`.

Now let's comment that constant definition too. Now this leaves Ruby with the superclass `House` as the next place in the inheritance chain where it will look and resolve the constant as `House Keys`.

Let's comment out the `KEYS` in `House` now. Ruby will continue to traverse the inheritanc chain, this time going all the way up to top scope where it will find `KEYS` and resolve it as  `Toy Keys`. That is how the scope gets dictated by inheritance. But there is one last caveat.

Let's say that we have a feeling we left the keys somewhere in the `Hosue`, so we tell Ruby to search there, now our code looks like this:
```ruby
KEYS = 'Toy Keys'

module OldKeys
  KEYS = 'Old Car Keys'
end

module FriendHouse
  KEYS = 'Car Keys'
end

class House
  KEYS = 'House Keys'
end

class Livingroom < House

end

class Garage < House
  include FriendHouse
  include OldKeys

  KEYS = 'Safe Keys'

  def search_for_keys
    House::KEYS
  end
end


garage = Garage.new
p garage.search_for_keys # House Keys
```
This has helped us bypass the look up chain, because we knew where we'd find something we were looking for. However, if the constant resolution operator gets used to tell Ruby where to look and it goes and does not find it, we are relinquishing the chance to continue to search, because this means Ruby will _not_ continue to search up the inheritance chain and into top level scope. It will simply give up. So if we commented out the `KEYS` in `House` and still wanted to use the call `House::KEYS`, Ruby would throw an error upon realizing it is not there.


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

