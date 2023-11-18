#In the previous exercise, you wrote a program to solicit a password.
#In this exercise, you should modify the program so it also requires a user name.
#The program should solicit both the user name and the password, then validate both,
#and issue a generic error message if one or both are incorrect;
#the error message should not tell the user which item is incorrect.

username = "pedrogdcl"
password = "Password"
username_attempt = nil
password_attempt = nil

loop do
  print "Username?"
  username_attempt = gets.chomp.to_s
  print "Password?"
  password_attempt = gets.chomp.to_s

  username_check = (username == username_attempt)
  password_check = (password == password_attempt)

  break if username_check && password_check == true
  
  puts "Incorrect credentials! Please try again."
end

puts "Welcome!"