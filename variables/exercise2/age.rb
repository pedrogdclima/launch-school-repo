puts "How old are you?"
age = gets.chomp.to_i
puts "Given that you are #{age} years old today, in"

fy = [10,20,30,40]

for i in fy do
  puts "#{i} years you will be #{i+age}!"
end