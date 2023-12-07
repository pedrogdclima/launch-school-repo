number_of_lines = nil
loop do
  puts '>> How many output lines do you want? Enter a number >= 3 (Q to quit)'
  number_of_lines = gets.chomp
  break if number_of_lines.to_s.upcase == "Q"
  break if number_of_lines.to_i >= 3
  puts ">> That's not enough lines."
end

while number_of_lines.to_i > 0
  break if number_of_lines.to_s.upcase == "Q"
  puts 'Launch School is the best!'
  number_of_lines.to_i -= 1
end
