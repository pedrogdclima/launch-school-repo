#Loops and Iterators Exercise 3
#Write a method that counts down to zero using recursion.

def countdown (start)
  if start <= 0
    puts 0
    puts "And we're done!"
  else
    puts start
    countdown (start - 1)
  end
end

start = gets.chomp.to_i
countdown(start)