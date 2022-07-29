#### Methods
Methods should do _one_ thing only. Don't have a methid that both outputs something and returns
something valuable. 

Decide if a method will return a meaninful value with no side effects or if it will have side effects with no meaninful return value. Having both will lead to confusion when you go to use it, especially in larger programs.