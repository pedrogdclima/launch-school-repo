#Learning about do/while loops

loop do
  puts "Shall we go again?"
  answer = gets.chomp
  if answer != "Y"
    break
  end
end
