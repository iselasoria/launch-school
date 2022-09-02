#### Methods Best Practices

##### Return values and side effects
Methods should do _one_ thing only. Don't have a methid that both outputs something and returns
something valuable. 

Decide if a method will return a meaninful value with no side effects or if it will have side effects with no meaninful return value. Having both will lead to confusion when you go to use it, especially in larger programs.

##### Same Level of Abstraction
deal()
hit()
stay()
iterate_through_cards()

In the above list, the last one stands out. The first three imply "what" they do, the last one "how" it is done. They are not at the same level of abstraction, and they should be organized by level of abstraction.

##### Method Names Should Reflect Mutation
Use a naming convention that immediately lets you identify if a method is mutating arguments (side effects) or if it is returning something.
Example:
- `update_total` <-- you read this and you expect this method to not return anything, just mutate in this case, the total
- `total` <-- this one tells you there is a return value to be expected.

#### Common Ruby Methods [[collection-methods#]]
