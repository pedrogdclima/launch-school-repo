=begin
Create a method that takes a single integer argument and returns the sum of all the multiples of 7 or 11 that are less than the argument. If a number is a multiple of both 7 and 11, count it just once.

For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 21, and 22. The sum of these multiples is 75.

If the argument is negative, return 0.

The test below should each print true.
=end

# Problem
# -For a given integer, return the sum of all the multiples of 7 or 11 that are smaller than the given integer.
# -Do not count multiples twice, ie if number is a multiple of both, only count it once
# -If argument is negative, return 0

# Data
# -Array where we shovel all multiples

# Algorithm
# -First, return 0 is integer is less than 0
# -Using range (1..integer), check if number % 7 is 0, if so shovel to array_of_multiples
# -Check if number % 11 is 0 and number % 7 is not 0, if so shovel to array_of_multiples
# -Return array_of_multiples.sum

def seven_eleven(integer)
    return 0 if integer < 0
    array_of_multiples = []
    (1...integer).each do |num|
        array_of_multiples << num if num % 7 == 0
        array_of_multiples << num if num % 11 == 0 && num % 7 != 0
    end
    array_of_multiples.sum
end

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0

# 11 minutes - 28.06.2024
