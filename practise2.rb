loop do
  puts "Would you like me to print something? Y or N?"
  input = gets.chomp.upcase
  if input == "Y"
    puts "something"
    break
  elsif input == "N"
    break
  else
    puts "Invalid input!"
  end
end

# loop do
#   puts "Would you like me to print something? Y or N?"
#   input = gets.chomp.upcase
#   if (input != "Y" || input != "N")
#     puts "Invalid input!"
#     next
#   elsif input == "Y"
#     puts "something"
#     break
#   else
#     break
#   end
# end