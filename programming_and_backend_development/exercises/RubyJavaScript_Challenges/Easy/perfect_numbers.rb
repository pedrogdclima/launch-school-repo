=begin
The Greek mathematician Nicomachus devised a classification scheme for natural numbers (1, 2, 3, ...), identifying each as belonging uniquely to the categories of abundant, perfect, or deficient based on a comparison between the number and the sum of its positive divisors (the numbers that can be evenly divided into the target number with no remainder, excluding the number itself). For instance, the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

Perfect numbers have an Aliquot sum that is equal to the original number.
Abundant numbers have an Aliquot sum that is greater than the original number.
Deficient numbers have an Aliquot sum that is less than the original number.

Examples:

6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.

28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.

15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.

24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.

Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

Write a program that can tell whether a number is perfect, abundant, or deficient.
=end

# Problem
# - For a given interger, return "perfect", "deficient", or "abundant"

# Data
# - Class PerfectNumber
#   - class method .classify(input_integer)
# - Input => integer
# - Output => string ("perfect", "deficient", or "abundant")

# Algorithm
# - divisible_counter = 0
# - 1.upto(input_integer)
#   - Iterate over numbers checking if input_integer % number == 0
#   - If so, increment divisible_counter

class PerfectNumber

  def self.classify(input_integer)
    raise StandardError if input_integer.abs != input_integer
    new(input_integer).type
  end

  def initialize(input_integer)
    @input_integer = input_integer
    @divisible_counter = 0
    1.upto(input_integer / 2) do |i|
      @divisible_counter += i if input_integer % i == 0
    end
  end

  def type
    if @divisible_counter > @input_integer
      "abundant"
    elsif @divisible_counter < @input_integer
      "deficient"
    else
      "perfect"
    end
  end
end
