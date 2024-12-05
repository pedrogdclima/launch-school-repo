# rubocop:disable Layout/LineLength
=begin
Write a program that will take a string of digits and return all the possible consecutive number series of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

012
123
234
Likewise, here are the 4-digit series:

0123
1234
Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.
=end
# rubocop:enable Layout/LineLength

# Problem
# - For a given string of digits, return all slices of a given length

# Examples/Test Cases
# See test file and example provided above

# Data
# - Class Series
#   - Instance method
#     - initialize(string of digits)
#     - slices(size of slice) => returns array of consecutive integers

# Algorithm
# - Raise ArgumentError if slice size is greater than input string size
# - Splice input string using string[index, input]
# - .map on array

class Series
  def initialize(input)
    @string_of_digits = input
  end

  def slices(slice_length)
    raise ArgumentError if slice_length > @string_of_digits.length
    output_array = []
    @string_of_digits.length.times do |index|
      output_array << @string_of_digits[index, slice_length]
    end
    output_array.select { |ele| ele.size == slice_length }.map do |ele|
      ele.chars.map(&:to_i)
    end
  end
end

# Start Time => 11:58
# End Time => 12:15
# Total Time => 17
