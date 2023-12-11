#Create a calculator program that takes two numbers provided by the user and performs an operation chosen by the user

#Welcome user
puts "Welcome! This program will take two numbers you'll provide, ask waht operation you would like to perform, and then return the result."

#Get two numbers
print "First number: "
number1 = gets.chomp
print "Second number: "
number2 = gets.chomp

#Select operation
puts "Would you like to add, subtract, multiply, or divide?"
operation = gets.chomp

#Perform and print result
if operation == "add"
  result = number1.to_i + number2.to_i
elsif operation == "subtract"
  result = number1.to_i - number2.to_i
elsif operation == "multiply"
  result = number1.to_i * number2.to_i
elsif operation == "divide"
  result = number1.to_f / number2.to_f
end

puts "The result is #{result}!"