## 27

**How does encapsulation relate to the public interface of a class?**

Encapsulation prevents certain parts of the code from being exposed to the public interface.

---
## 29

**When does accidental method overriding occur, and why? Give an example.**

---

## 30
**How is Method Access Control implemented in Ruby? Provide examples of when we would use public, protected, and private access modifiers.**
protected- current class and clas hierrarchy, not isolaertd classes. this is prvate and protected

---


## 31
**Describe the distinction between modules and classes.**

The main difference between modules and classes is that modules cannot instantiate objects, while classes can.

Classes can be used to implement single-class inheritance, while modules are Ruby's workaround to support multiple inheritance.
---


## 32
**What is polymorphism and how can we implement polymorphism in Ruby? Provide examples.**

Polymorphism is the ability of different objects to respond to a common interface. In Ruby, we can have two types of polymorphism:
  polymorphism by inheritance
  polymorphism by duck-typing

The first one can be achieved by inheriting a common instance method from a superclass and overriding it to fit the needs of the subclass. This by design, is allowing objects of different but related classes to respond to a common interface.
The second, can be achieved by treating different objects as if they were similar, or related in some way.

#### Polymorphism by Inheritance
```ruby
class FireFighter
  attr_reader :name, :employee_id

  def initialize(name, employee_id)
    @name = name
    @employee_id = employee_id
  end

end

al1 = FireFighter.new('Albert', 'FS2398')
al2 = FireFighter.new('Albert', 'FS2398')
p al1 == al2 # false because we are borrowing BasicObject#== implementation
```
To implement polymorphism on the code above, we could define the following method to override the implementation of `BasicObject#==`:
```ruby
  def ==(other)
    employee_id == other.employee_id
  end
```

#### Polymorphism by Duck-Typing

```ruby
class Dancer
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class ArabDancer < Dancer
  def dance
    "I'm #{name} and I'm a belly dancer from Lebanon."
  end
end

class IndianDancer < Dancer
  def dance
    "I'm #{name} and I'm a Bollywood dancer from Mumbai."
  end
end

class LatinDancer < Dancer
  def dance
    "I'm #{name} and I'm a mambo dancer from Havana."
  end
end


itnl_dance_competition = [ArabDancer.new('Taheyya'), IndianDancer.new('Pallavi'), LatinDancer.new('Ana Maria')]
itnl_dance_competition.each {|performer| p performer.dance}

# "I'm Taheyya and I'm a bellydancer from Lebanon."
# "I'm Pallavi and I'm a Bollywood dancer from Mumbai."
# "I'm Ana Maria and I'm a mambo dancer from Havana."
```

The code above gives each different class a common method, we don't care how they dance, all we care is that they dance. How they implement their behavior is up to them.

---


## 33
**What is encapsulation, and why is it important in Ruby? Give an example.**

---
