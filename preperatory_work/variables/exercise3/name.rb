puts "What is your name?"
name = gets.chomp
greeting = "Hello #{name}! Welcome, please make yourself feel at home."
puts greeting

puts "And now here's your name printed 10 times!"
10.times{puts name}