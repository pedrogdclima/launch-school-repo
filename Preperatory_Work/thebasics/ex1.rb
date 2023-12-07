puts "What 4 digit number do you want to breakdown?"
n = gets.chomp

n1000 = (n.to_i/1000)%10
puts "In the 1000s its #{n1000}"

n100 = (n.to_i/100)%10
puts "In the 100s its #{n100}"

n10 = (n.to_i/10)%10
puts "In the 10s its #{n10}"

n1 = (n.to_i/1)%10
puts "In the 1s its #{n1}"