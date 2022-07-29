
# methods
def prompt(msg)
  puts "=> #{msg}"
end

def valid_amount?(amt)
  amt > 0
end

# TODO this is the calculation in RUby
# m = p * (j / (1 - (1 + j)**(-n)))
# where:
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = load duration in months

# program flow
prompt("Welcome to the calculator. How much money do you need to borrow?")
principal = gets.chomp.to_i
p valid_amount?(principal)
p principal

prompt("What is the interest rate?")
interest_rate = gets.chomp.to_f
p interest_rate

prompt("What is the duration of this loan?")
duration_months = gets.chomp.to_i * 12
p duration_months

annual_interest_rate = interest_rate.to_f() / 100
monthly_interest_rate = annual_interest_rate / 12


prompt("Hold on a second, calculating you monthly payment...")

# m = p *                      (j           / (1 - (1 + j)**(-n)))
monthly_payment = principal.to_f * 
                  (monthly_interest_rate / 
                  (1 - (1 + monthly_interest_rate)**(-duration_months)))
monthly_payment = monthly_payment.round(2)

puts "Your monthly payment will be $#{monthly_payment}"