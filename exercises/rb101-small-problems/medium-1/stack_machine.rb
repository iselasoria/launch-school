=begin
A stack is a list of values that grows and shrinks dynamically. In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.

A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. Operations that require two values pop the topmost item from the stack (that is, the operation removes the most recently pushed value from the stack), perform the operation using the popped value and the register value, and then store the result back in the register.

Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and then stores the result back in the register. Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), and a register value of 7, then the MULT operation will transform things to 3 6 on the stack (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, then the stack is transformed to 3, and the register is left with the value 168.

Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

    n Place a value n in the "register". Do not modify the stack.
    PUSH Push the register value on to the stack. Leave the value in the register.
    ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
    SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
    MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
    DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
    MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
    POP Remove the topmost item from the stack and place in register
    PRINT Print the register value

All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program may assume that all programs are correct programs; that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.

You should initialize the register to 0.
------------------P 
input: a string 
output: integer 

register = 0
stack 
n --> places things in the register 
push --> changes the reister 
add --> removes item from stack and places it in register (register is a running sum?)
sub --> removes items from stack and does register - item
mult --> from stack operation done on register
div ----> from stack operation done on register
mod ---> from stack operation done on register
pop --> removes the topmost from the stack and puts it in the register 
print --> prints register value

------------------E
------------------D 
stack = []
register = 0

{
  n: register += n.to_i,
  push: stack << n,
  add: register += stack.pop,
  sub: register -= stack.pop,
  mult: register *= stack.pop,
  div: register /= stack.pop, 
  mod: register % stack.pop, 
  pop: register << stack.pop,
  print: puts register 
}
------------------A 
- split the input string into an array of words ['5', 'PUSH', '3' ,'MULT' ,'PRINT']
- initialize a variable stack = []
- initialie a variable register = 0
- iterate over the list of commands 
  - case when command is push
    - retrieve the command stored in the commands hash 
      --- ['5', 'PUSH', '3' ,'MULT' ,'PRINT']
          register = 5
          commands_hash["PUSH"] stack << n 

=end




def minilang(str)
  command_list = str.split(" ")
  # p command_list
  stack = [] #[5]
  register = [].sum
  # puts"register #{register}"

  command_list.each do |command|
    if command == command.to_i.to_s #&& register == 0
      register = command.to_i 
    elsif command == 'PUSH'
      stack << register
    elsif command == 'ADD'
      register += stack.pop
    elsif command == 'SUB'
      register -= stack.pop
    elsif command == 'MULT'
      register *= stack.pop
    elsif command == 'DIV'
      register /= stack.pop 
    elsif command == 'MOD'
      register %= stack.pop 
    elsif command == 'POP'
      register = stack.pop
    elsif command == 'PRINT'
       p register
    end

  end

  register
end



minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15



minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('5 PUSH POP PRINT')
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
minilang('-3 PUSH 5 SUB PRINT')
minilang('6 PUSH')
# # (nothing printed; no PRINT commands)