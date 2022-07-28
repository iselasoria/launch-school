require 'yaml'

MESSAGES = YAML.load_file('/Users/rosasoria/Documents/ft_ls/rb101/calculator/calculator-messages.yaml')

# quick check to see how messages are getting imported
# puts MESSAGES.inspect

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  %w(0 1 2 3 4 5 6 7 8 9).include?(num)
  # num.to_i() != 0
end

def number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(op)
word =  case op
        when '1'
          'Adding'
        when '2'
          'subtracting'
        when '3'
          'multiplying'
        when '4'
          'dividing'
        end
        x = "Random line for testing"
word
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['invalid_name'])
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['ask_num1'])
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['num_validation'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['ask_num2'])
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['num_validation'])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['op_validation'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers")

  result = case operator
           when '1' 
            number1.to_i() + number2.to_i()
           when '2'
            number1.to_i() - number2.to_i()
           when '3'
            number1.to_i() * number2.to_i()
           when '4'
            number1.to_f() / number2.to_f()
           end



  prompt("The result is #{result}")
  prompt(MESSAGES['redo'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['bye'])
