#Learning how while loops work
puts "What number shall we countdown from?"
x = gets.chomp.to_i

while x >= 0
  print  x
  x = x-1
  puts "..."
end

puts "And lift-off!"
