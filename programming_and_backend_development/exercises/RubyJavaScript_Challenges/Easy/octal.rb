# rubocop:disable Layout/LineLength
=begin
Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output. Treat invalid input as octal 0. The only valid digits in an octal number are 0, 1, 2, 3, 4, 5, 6, and 7.

Note: Implement the conversion yourself. Don't use any built-in or library methods that perform the necessary conversions for you. In this exercise, the code necessary to perform the conversion is what we're looking for.


=end
# rubocop:enable Layout/LineLength

# Problem
# - For a given octal number as a string object, return convert and return its value in decimal as an integer
# - Return 0 for all invalid inputs

# Examples/Test Cases
# - See test file

# Data
# - Invalid outputs:
#   - string includes anything other than 0..7
# - Class Octal with methods:
#   - .initialize
#   - .to_decimal

# Algorithm
# - method to check if input is valid
#   - check if any chars of input are not 0..7
#   - if so, .to_decimal returns 0
# - iterate over each chars of input and add appropriate to running_sum
#   - for input.reverse use index (8^idx), char * 8^idx 

# Code

class Octal
  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    running_sum = 0
    @octal_string.chars.reverse.each_with_index do |char, index|
      return 0 if !("0".."7").include?(char)
      running_sum += (char.to_i * (8 ** index))
    end
    running_sum
  end
end

# Start Time => 12:37
# Pause => 12:59
# Unpause => 7:24
# End Time => 7:27
# Total Time => 25 minutes