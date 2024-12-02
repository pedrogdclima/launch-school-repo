#Learning about conditionals in Ruby

puts "Give me a number!"
a = gets.chomp.to_i

if a == 3
  puts "You gave me a 3!"
elsif a == 4
  puts "You gave me a 4!"
else
  puts "You gave me something that isnt a 3 or a 4!"
end
