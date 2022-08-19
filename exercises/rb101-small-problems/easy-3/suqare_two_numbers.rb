# using the `multiply_two_numbers` problem, write a method that
# computers the square of its argument

def multiply(num1, num2)
  num1 * num2
end


def square(number)
  multiply(number, number)
end

p square(5) == 25
p square(-8) == 64