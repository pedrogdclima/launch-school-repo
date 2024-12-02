# Create a calculator program that takes two numbers provided by the user
# and performs an operation chosen by the user

# Welcome user
def prompt(message)
  puts "=> #{message}"
end

def valid_number(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when "1"
    "plus"
  when "2"
    "minus"
  when "3"
    "times"
  when "4"
    "divided by"
  end
end

prompt("Welcome! This program will take two numbers you'll provide, ask what operation you would like to perform, and then return the result.")

sleep 3

prompt "But before we start, what is your name?"

username = gets.chomp

prompt "Hi #{username}! Let's get started"

sleep 1

loop do
  # Get two numbers
  number1 = nil
  loop do
    prompt("First number: ")
    number1 = gets.chomp
    break if valid_number(number1)
    prompt("That is not a valid response. Please try again.")
    sleep 1
  end
  number2 = nil
  loop do
    prompt("Second number: ")
    number2 = gets.chomp
    break if valid_number(number2)
    prompt("That is not a valid response. Please try again.")
    sleep 1
  end
  # Select operation
  operator_prompt = <<-TXT
    Would you like to:
    1 => Add
    2 => Subtract
    3 => Multiply
    4 => Divide
  TXT
  prompt operator_prompt
  result = nil
  operation = nil
  loop do
    operation = gets.chomp
    # Perform and print result
    result =
      case operation
      when "1"
        number1.to_i + number2.to_i
      when "2"
        number1.to_i - number2.to_i
      when "3"
        number1.to_i * number2.to_i
      when "4"
        number1.to_f / number2.to_f
      end
    if %w(1 2 3 4).include?(operation)
      break
    else
      prompt "Please choose 1, 2, 3, or 4!"
    end
  end
  prompt "#{number1} #{operation_to_message(operation)} #{number2} is #{result}"
  sleep 2
  prompt("Would you like to perform another calculation?")
  break unless gets.downcase.start_with?("y")
end

prompt "Thanks for using the Calculator app #{username}!"
