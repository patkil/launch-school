def prompt(message)
  p message
end

def valid_number?(number)
  number.to_i != 0
end

def operation_to_message(op)
  case op
  when "add" then "adding"
  when "subtract" then "subtracting"
  when "multiply" then "multiplying"
  when "divide" then "dividing"
  end
end

prompt("Welcome to calculator. Enter your name: ")

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt("nah dude, use a real name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  # ask the user for numbers, and store their results
  first_number = ''
  loop do
    prompt("Tell me your first number: ")
    first_number = gets.chomp.to_i
    if valid_number?(first_number)
      break
    else
      prompt("That doesn't look like a valid number.")
    end
  end

  second_number = ''
  loop do
    prompt("Tell me your second number: ")
    second_number = gets.chomp.to_i
    if valid_number?(second_number)
      break
    else
      prompt("use a valid number plz")
    end
  end

  # ask the user for the operation (+ - * /) and store the input
  operation = ''
  loop do
    operator_prompt = <<-MSG
      What operation would you like to perform?
      (add, subtract, multiply, or divide)
    MSG
    prompt(operator_prompt)
    operation = gets.chomp.downcase
    if %w(add subtract multiply divide).include?(operation)
      break
    else
      prompt("pick a valid operator!")
    end
  end

  prompt("#{operation_to_message(operation)} the numbers...")

  # perform the math and print the result
  result =
    case operation
    when "add" then first_number + second_number
    when "subtract" then first_number - second_number
    when "multiply" then first_number * second_number
    when "divide" then first_number / second_number
    end

  prompt("The result is #{result}.")

  prompt("Do you want to perform another calculation? (y / n)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("thanks so much! goodbye!")
