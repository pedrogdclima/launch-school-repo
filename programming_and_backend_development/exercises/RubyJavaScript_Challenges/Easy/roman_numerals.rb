# rubocop:disable Layout/LineLength
=begin
Write some code that converts modern decimal numbers into their Roman number equivalents.

The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these letters have lots of straight lines and are hence easy to hack into stone tablets.

 1  => I
10  => X
 7  => VII

There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:

1000=M
900=CM
90=XC

2008 is written as MMVIII:

2000=MM
8=VIII
=end

# rubocop:enable Layout/LineLength

# Problem
# -For a given integer under 3000, return a its numerical value in roman num

# Examples/Test Cases
# See test file

# Data
# Input => Integer smaller than 3001
# Output => String (combination of 'I', 'V', 'X', 'L', 'C', 'D', 'M')
#   - I => 1
#   - V => 5
#   - X => 10
#   - L => 50
#   - C => 100
#   - D => 500
#   - M => 1000
# - Class RomanNumeral

# Algorithm
# - Input integer into string, then into array of chars, index
#   represents decimal place
# - Same pattern independent of decimal spot
# - For a given digit, if it is 3 or less, use 3 of the "1" symbol
#   - if it is 4 use symbol for "1" then symbol for "5"
#   - if it is 6 to 8 use symbol for "5" and some number of "1"
#   - if it is 9 use symbol for "1" then symbol for "10"

=begin
# First working solution. Refactored solution below.

class RomanNumeral
  def initialize(integer)
    @array_of_digits = integer.to_s.chars
  end

  def to_roman
    output_string = ""
    @array_of_digits.reverse.each_with_index do |number, index|
      next if number == "0"
      output_string.prepend(romanize(number.to_i, index))
    end
    output_string
  end

  def romanize(number, index)
    case index
    when 0 then ones(number)
    when 1 then tens(number)
    when 2 then hundreds(number)
    when 3 then thousands(number)
    end
  end

  def ones(number)
    case number
    when 1..3 then "I" * number
    when 4 then "IV"
    when 5 then "V"
    when 6..8 then "V" + "I" * (number - 5)
    when 9 then "IX"
    end
  end

  def tens(number)
    case number
    when 1..3 then "X" * number
    when 4 then "XL"
    when 5 then "L"
    when 6..8 then "L" + "X" * (number - 5)
    when 9 then "XC"
    end
  end

  def hundreds(number)
    case number
    when 1..3 then "C" * number
    when 4 then "CD"
    when 5 then "D"
    when 6..8 then "D" + "C" * (number - 5)
    when 9 then "CM"
    end
  end

  def thousands(number)
    case number
    when 1..3 then "M" * number
    when 4 then "IV"
    when 5 then "V"
    when 6..8 then "V" + "I" * number
    when 9 then "IX"
    end
  end
end

# p RomanNumeral.new(101).to_roman

# Start time => 10:56
# End time => 11:40
# Total time => 44 minutes
=end

# Refactored version

# class RomanNumeral
#   def initialize(integer)
#     @array_of_digits = integer.digits
#   end

#   def to_roman
#     @array_of_digits.map.with_index do |num, idx|
#       "" if num.zero?
#       roman_digit(num, idx)
#     end.reverse.join
#   end

#   def roman_digit(num, idx)
#     case num
#     when 1..3 then place_value(idx)[0] * num
#     when 4 then "#{place_value(idx)[0]}#{place_value(idx)[1]}"
#     when 5..8 then "#{place_value(idx)[1]}#{place_value(idx)[0] * (num - 5)}"
#     when 9 then "#{place_value(idx)[0]}#{place_value(idx)[2]}"
#     end
#   end

#   def place_value(idx)
#     case idx
#     when 0 then ["I", "V", "X"]
#     when 1 then ["X", "L", "C"]
#     when 2 then ["C", "D", "M"]
#     when 3 then ["M", "", ""]
#     end
#   end
# end

# Further refactored

class RomanNumeral
  PLACE_VALUE = [
    ["I", "V", "X"],
    ["X", "L", "C"],
    ["C", "D", "M"],
    ["M", "", ""]
  ]

  def initialize(integer)
    @array_of_digits = integer.digits
  end

  def to_roman
    @array_of_digits.map.with_index do |num, idx|
      "" if num.zero?
      roman_digit(num, idx)
    end.reverse.join
  end

  def roman_digit(num, idx)
    case num
    when 1..3 then PLACE_VALUE[idx][0] * num
    when 4 then "#{PLACE_VALUE[idx][0]}#{PLACE_VALUE[idx][1]}"
    when 5..8 then "#{PLACE_VALUE[idx][1]}#{PLACE_VALUE[idx][0] * (num - 5)}"
    when 9 then "#{PLACE_VALUE[idx][0]}#{PLACE_VALUE[idx][2]}"
    end
  end
end
