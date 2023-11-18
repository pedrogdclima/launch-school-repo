puts "How many lines do you want to print?"
lines = gets.chomp.to_i
loop do
  if lines < 3
    puts "That isn't enough lines! Try again!"
    lines = gets.chomp.to_i
    next
  else
    lines.times do
      puts "LaunchSchool is the best school!"
    end
  end
  break
end
