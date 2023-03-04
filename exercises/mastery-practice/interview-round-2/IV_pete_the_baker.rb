=begin 
* DONE 23m06s
https://www.codewars.com/kata/525c65e51bf619685c000059

Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you help him to find out, how many cakes he could bake considering his recipes?

Write a function cakes(), which takes the recipe (hash) and the available ingredients (also a hash) and returns the maximum number of cakes Pete can bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.

// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); 
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}); 


I: two hashes (recipe, pantry)
O: integer (cakes Pete can bake)


Goal: determine how many cakes can be baked with the available ingredients

Rules:
- no units 
- ingredients not found in the pantry can be considered to be 0 
- implicit rule:
  - the number of cakes is limited to the required ingredients of which I have the least 
  - I might have more in the pantry than what I need --> doesnt affect result 

Examples: 
- if pantry is empty, then no cakes 0 
- if there ingredients in the recipe that are not in the pantry, can't bake 

DS: 
  two hashes 
  integers 
  arrays 

Algorithm:
- return 0 if:
  - if pantry is empty
  - there are items in the recipe, that I don't have in the pantry 

- amounts = []
- iterate over recipe # ingredient, amnt 
  - for each ingredient that I'll need:
    - check how many times the ingredient that I need goes into what I have 
     # potential cakes is set to the return of: recipe amnt / pantry amnt 

- select the smallest of the amounts 
=end 

def cakes(recipe, pantry)
  return 0 if pantry.empty? 
  return 0 if recipe.keys.any?{|ingredient| !pantry.keys.include?(ingredient)}

  amounts = []
  recipe.each do |ingredient, amnt|
    potential_cakes = pantry[ingredient] / amnt 
    amounts << potential_cakes
  end
  amounts.min
end

# test cases 

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0

p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0



