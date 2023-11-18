#Loops and Iterators Exercise 2
#Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.

puts "Gimme some input"
x = gets.chomp

while x != "STOP" do
  puts "Not stopping yet!"
  x = gets.chomp
end