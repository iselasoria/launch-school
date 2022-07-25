# E1 What will the following code print and why?
a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a

# SOLUTION-- 
=begin
In the method definition, the parameter b is defined and 10 gets added to it. So by the time the method executes,
the value of b (inside the method) is 17. However, because the assignment opperator `+=` is used, the variable gets 
redirected and starts pointing to anotehr place in memory, and no longer references the same location as variable `a`. 
=end
# E2 