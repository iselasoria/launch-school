# Consider the following:
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# what will get printed?

# SOLUTION
# [4, 5, 3, 6]
# this works from the outside, inward. Meaning 4 is assigned to the first variable, a.
# meanwhile, the number 6 gets assgined to the last variable, d. That leaves b and c, and we have one extra
# argument passed, so it goes to the first variable it encounters, which is b. That means variable c uses its default variable.