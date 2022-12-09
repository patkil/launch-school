def prompt(message)
  p message
end

def calc_monthly_interest_rate(apr)
  (apr / 12) / 100
end

def calc_loan_duration_months(loan_duration_years)
  loan_duration_years * 12
end

def calc_monthly_payment(total_loan_amount,
                         monthly_interest_rate,
                         loan_duration_months)
  total_loan_amount *
    (monthly_interest_rate /
    (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))
end

# gather inputs from the user
prompt("Welcome to the mortgage calculator!")
prompt("To get started, we'll need some basic information: ")

# total loan amount
prompt("What is your total loan amount in USD?: ")
total_loan_amount = gets.chomp.to_f

# APR
prompt("What is your APR?: ")
apr = gets.chomp.to_f

# loan duration
prompt("What is the duration of your loan in years?")
loan_duration_years = gets.chomp.to_f

# calculate monthly interest rate
monthly_interest_rate = calc_monthly_interest_rate(apr)

# calculate loan duration in months
loan_duration_months = calc_loan_duration_months(loan_duration_years)

# calculate monthly payment
monthly_payment = calc_monthly_payment(total_loan_amount,
                                       monthly_interest_rate,
                                       loan_duration_months)

prompt("Your monthly payment is $#{monthly_payment.round(2)}.")
