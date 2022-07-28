require 'yaml'

MESSAGES = YAML.load_file('/Users/rosasoria/Documents/ft_ls/rb101/calculator/calculator-messages.yaml')
LANGUAGE='es'
# quick check to see how messages are getting imported
# puts MESSAGES.inspect

def messages(message, lang='en')
  MESSAGES[lang][message]
end

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

# prompt(MESSAGES['welcome'])
prompt(messages('welcome',LANGUAGE))

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(messages('invalid_name', LANGUAGE))
  else
    break
  end
end

# prompt("Hi #{name}")
prompt(messages('hi', LANGUAGE) + ' ' + name)

loop do # main loop
  number1 = ''
  loop do
    prompt(messages('ask_num1', LANGUAGE))
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(messages('num_validation', LANGUAGE))
    end
  end

  number2 = ''
  loop do
    prompt(messages('ask_num2', LANGUAGE))
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(messages('num_validation', LANGUAGE))
    end
  end

  # operator_prompt = MESSAGES['operation']

  prompt(messages('operation', LANGUAGE))

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('op_validation', LANGUAGE))
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



  # prompt("The result is #{result}")
  prompt(messages('result', LANGUAGE) + ' ' + result.to_s)
  prompt(messages('redo', LANGUAGE))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(messages('bye', LANGUAGE))
