# Create a calculator program that takes two numbers provided by the user and performs an operation chosen by the user

# Welcome user
def prompt(message)
  puts "=> #{message}"
end

def valid_number(num)
  num.to_i != 0
end

prompt("Welcome! This program will take two numbers you'll provide, ask waht operation you would like to perform, and then return the result.")
loop do
  # Get two numbers
  number1 = nil
  loop do
    prompt("First number: ")
    number1 = gets.chomp
    break if valid_number(number1)
    prompt("That is not a valid response. Please try again.")
  end
  
  number2 = nil
  loop do
    prompt("Second number: ")
    number2 = gets.chomp
    break if valid_number(number2)
    prompt("That is not a valid response. Please try again.")
  end
  
  # Select operation
  prompt("Would you like to add, subtract, multiply, or divide?")
  operation = gets.chomp
  
  # Perform and print result
  result = case operation
          when "add"
            number1.to_i + number2.to_i
          when "subtract"
            number1.to_i - number2.to_i
          when "multiply"
            number1.to_i * number2.to_i
          when "divide"
            number1.to_f / number2.to_f
          end
  
  prompt("The result is #{result}!")
  
  prompt("Would you like to perform another calculation?")
  break unless gets.downcase.start_with?("y")
end