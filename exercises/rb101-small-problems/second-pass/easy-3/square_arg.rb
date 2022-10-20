=begin
Using multiply from the previous exercise, write a method that computes the square of its argument.

=end


def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

# test case
p square(5) == 25
p square(-8) == 64