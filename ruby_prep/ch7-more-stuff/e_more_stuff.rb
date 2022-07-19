# E1 write a program that checks if the sequence of characters "lab" exists in the following strings. If it does, print it out.
arre = ["laboratory","experiment","Pans Labyrinth","elaborate","polar bear"]

def checker(word)
  if /lab/ =~ word
    puts word
  else
    puts "No Match"
  end
end

arre.each do |item|
  checker(item)
end

# E2 What will the following print and what will it return?
def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

# nothing gets printed because block never gets called with `call` method
# and the method returns a proc

# E3 What is exception handling and what prblem does it solve?
# Exception handling allows for a program to contiue to execute without stopping 
# when it encounters an error. It is useful because it alos logs error

# E4 Modify the code in exercise 2 to make the block execute properly
def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# E5 Why does the following code give the following error:
def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
from test.rb:5:in `<main>'

# the way we are passing the block is the issue, it should use an ampersand &block
