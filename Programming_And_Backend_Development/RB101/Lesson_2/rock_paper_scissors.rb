VALID_CHOICES = ["rock", "paper", "scissors"]

def prompt message
  puts "==> #{message}"
end

def show_result(user, cpu)
  if user == "rock" && cpu == "scissors" ||
     user == "paper" && cpu == "rock" ||
     user == "scissors" && cpu == "paper"
    prompt "I chose #{cpu} so you win!"
  elsif user == "rock" && cpu == "paper" ||
        user == "paper" && cpu == "scissors" ||
        user == "scissors" && cpu == "rock"
    prompt "I chose #{cpu} so I win!"
  else
    prompt "We both chose #{user} so it's a draw!"
  end
end

user_choice = nil

prompt "Welcome to Rock, Paper, Scissors!"

# loop do
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
  show_result(user_choice, cpu_choice)
# end
prompt "Thanks for playing! Goodbye!"
