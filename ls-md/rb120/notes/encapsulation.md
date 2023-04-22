Encapsulation is the act of hiding some portions of the program from the external interface. Encapsulation is essentially being intentional about what code we expose to the rest of the codebase. As a rule of thumb, we should have as little public code as possible because this protects data from being changed unintentionally. Segregating the instance variables and behaviors through encapsulation makes the code more reusable because if other parts of the code don't _know_ about the intricacies of the implementation of a given method, they just know to respond to it, then if changes happen in the implementation the methods that interact with an encapsulated object will likely continue to work despite changes. 

Objects encapsulate [[state]]. Objects of the same class are only aware of themselves and their current state, not of objects outside even if they are of the same class. 

[[instance]]
[[access modifiers]]

One way we achieve encapsulation is via [[method access control]].