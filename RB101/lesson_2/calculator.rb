

#ask the user for numbers, and store their results
p "Tell me your first number:"
first_number = gets.chomp.to_i

p "Tell me your second number"
second_number = gets.chomp.to_i

#ask the user for the operation (+ - * /) and store the input
p "What operation would you like to perform? (add, subtract, multiply, or divide)"
operation = gets.chomp.downcase


#perform the math and print the result
result = case operation
when "add" then first_number + second_number
when "subtract" then first_number - second_number
when "multiply" then first_number * second_number
when "divide" then first_number / second_number
end

p "The result is #{result}."
