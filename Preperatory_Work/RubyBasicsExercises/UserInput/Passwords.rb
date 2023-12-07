#Write a program that displays a welcome message,
#but only after the user enters the correct password,
#where the password is a string that is defined as a constant in your program.
#Keep asking for the password until the user enters the correct password.

pswrd = "Password"
attempt = nil

while attempt != pswrd
  puts "What is the password?"
  attempt = gets.chomp
  puts "Incorrect!" if attempt != pswrd
end

puts "Welcome!"