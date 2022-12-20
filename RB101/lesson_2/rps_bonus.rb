require 'pry'

VALID_CHOICES = %w(rock paper scissors spock lizard)
POSSIBLE_INPUTS = %w(r p sc sp l)
INPUT_MAP = {
  r: "rock",
  p: "paper",
  sc: "scissors",
  sp: "spock",
  l: "lizard"
}

def prompt(message)
  p "=> #{message}"
end

def display_input_choices
  INPUT_MAP.each do |k,v|
    p "Enter #{k} for #{v}."
  end
end


def win?(player_1_move, player_2_move)
  move_wins_if = {
    rock: %w(lizard scissors),
    paper: %w(rock spock),
    scissors: %w(paper lizard),
    spock: %w(rock scissors),
    lizard: %w(paper spock)
  }
  move_wins_if[player_1_move.to_sym].include?(player_2_move)
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

# main loop
player_score = 0
computer_score = 0
loop do 
  choice = ''
  loop do 
    prompt("Choose one: ")
    display_input_choices
    input = gets.chomp
    choice = INPUT_MAP[input.to_sym]
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("that's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice} and computer chose #{computer_choice}.")

  display_results(choice, computer_choice)
  player_score += 1 if win?(choice, computer_choice)
  computer_score += 1 if win?(computer_choice, choice)
  if (player_score == 3 || computer_score == 3)
    p "GAME OVER"
    break
  end

  prompt("Current score is you: #{player_score} and computer: #{computer_score}.")
  prompt("do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
