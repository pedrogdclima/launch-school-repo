=begin
Write a method that takes a positive integer as an argument and returns
that number with its digits reversed.

Examples:
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1

Don't worry about arguments with leading zeros - Ruby sees those as octal numbers,
which will cause confusing results. For similar reasons, the return value for
our fourth example doesn't have any leading zeros.
=end

# Problem
# for a given integer, return the an integer made from the reversed digits

# Data
# Input => integer
# Output => integer

# Algorithm
# - First convert input into string
# - iterate over string, shovelling each character into a new string
#  - use the negative index to start from the end of the string
# - 

def reversed_number(integer)
    new_string = ""
    integer.to_s.each_char do |digit|
        new_string = digit + new_string
    end
    new_string.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1