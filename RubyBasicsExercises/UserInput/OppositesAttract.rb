#Write a program that requests two integers from the user, adds them together, and then displays the result.
#Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.
#Do not check for the positive/negative requirement until both integers are entered, and start over if the requirement is not met.

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_number
  loop do
    print "Please enter a positive or a negative number: "
    number = gets.chomp
    return number.to_i if valid_number?(number)
    number.to_s == "0" ? (puts "Zero is not a valid input.") : (puts "Invalid input.")
  end
end

integer_a = nil
integer_b = nil

loop do
  integer_a = get_number
  integer_b = get_number
  break if integer_a * integer_b < 0
  puts "Please start again. One number must be positive and one must be negative."
end

sum = integer_a + integer_b
puts "#{integer_a} plus #{integer_b} is equal to #{sum}"