VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  p "#{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == "scissors" && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else 
    prompt("it's a tie!")
  end
end


loop do 
  choice = ''
  loop do 
    prompt("Choose one: #{VALID_CHOICES.join(", ")}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("that's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice} and computer chose #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt("do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end