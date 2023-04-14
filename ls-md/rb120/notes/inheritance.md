Inheritance is the act of passing down behavior. This is a core concept in [[oop]] since it allows for more reusable, maintainable code where classes have single-use behavior. Inheritance lets us write code once and inherit it downstream. 

---

Ruby implements single- [[inheritance]]. This means that behaviors are passed down from a [[superclass]] to a [[subclass]] in a hierarchy pattern.

Ruby, unlike other languages, does not implement [[multiple inheritance]]. However, it does have a way to mimic that behavior via module [[mixins]].

This way, Ruby can include as many modules as it wants to borrow behavior that lives elsewhere outside the [[class]] definition. 

|   INHERITANCE TYPE      |   RELATIONSHIP TYPE  |    EXAMPLE        |    
| :----------------------:|:--------------------- |:-----------------------:|
| class inheritance       | _has-a_ relationship    | A dog _is a_ mammal.|
| module mixins           |  _is-a_ relationship    | A dog has an ability to swim.


tags: #major 