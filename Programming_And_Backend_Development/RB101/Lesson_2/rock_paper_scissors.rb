VALID_CHOICES = ["rock", "paper", "scissors"]

def prompt message
  puts "==> #{message}"
end

def determine_winner(player1, player2)
  if player1 == player2
    return nil
  elsif player1 == "rock" && player2 == "scissors" ||
     player1 == "paper" && player2 == "rock" ||
     player1 == "scissors" && player2 == "paper"
    return player1
  else
    return player2
  end
end

user_choice = nil
user_score = 0
cpu_score = 0

prompt "Welcome to Rock, Paper, Scissors!"
sleep 1
loop do
  loop do
    prompt "What is your choice?"
    user_choice = gets.chomp.downcase
    if VALID_CHOICES.include?(user_choice)
      break
    else
      prompt "--INVALID INPUT--"
      sleep 2
      prompt "Please type one of: #{VALID_CHOICES.join(", ")}!"
    end
  end
  cpu_choice = VALID_CHOICES.sample
  prompt "I choose #{cpu_choice}"
  sleep 2
  if determine_winner(user_choice, cpu_choice) == user_choice
    user_score += 1
    prompt "You win this round!"
  elsif determine_winner(user_choice, cpu_choice) == cpu_choice
    cpu_score += 1
    prompt "I win this round!"
  else
    prompt "It's a draw!"
  end
  sleep 2
  if user_score == 3 || cpu_score == 3
    prompt "That's it! You won #{user_score} and I won #{cpu_score}"
    break
  else
    prompt "The score is #{user_score} to you and #{cpu_score} to me."
    prompt "Next round."
  end
end
prompt "Thanks for playing! Goodbye!"
