Kernel.puts('Welcome to the calculator!')

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) mnultiply 4) divide")

operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number.to_i() - number2.to_i()
elsif operator == '3'
  result = number.to_i() * number2.to_i()
else 
  result = number.to_f() / number2.to_f()
end