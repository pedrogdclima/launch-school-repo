# require "pry"
# m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount = loan_amount
# j = monthly interest rate = monthly_interest
# n = loan duration in months = loan_duration_months

def prompt(message)
  puts "----- #{message}"
end

prompt "Welcome! Let's calculate your mortgage's monthly payment!"

prompt "What is the total loan amount?"
loan_amount = gets.chomp.to_f

prompt "What is the annual percent rate?"
annual_percent_rate = gets.chomp.to_f
monthly_interest = (annual_percent_rate / 100) / 12

prompt "What is the loan's duration (in months)?"
loan_duration_months = gets.chomp.to_f

monthly_payment = loan_amount * (monthly_interest / (1 - ((1 + monthly_interest)**(-loan_duration_months))))

prompt "Your monthly payment is $#{monthly_payment}"
