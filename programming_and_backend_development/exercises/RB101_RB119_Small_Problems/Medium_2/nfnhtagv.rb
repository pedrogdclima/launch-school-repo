=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.
=end

def featured(input_integer)
  until input_integer > 9_999_999_999
    input_integer += 1
    return input_integer if
      input_integer.odd? &&
      input_integer % 7 == 0 &&
      no_repeated_digits?(input_integer)
  end
  puts "No valid answer"
end

def no_repeated_digits?(integer)
  integer.digits.size == integer.digits.uniq.size
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements