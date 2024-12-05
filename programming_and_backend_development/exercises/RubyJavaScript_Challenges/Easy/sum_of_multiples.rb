# rubocop:disable Layout/LineLength
=begin
Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.
=end
# rubocop:enable Layout/LineLength

# Problem
# - For a given integer, find the sum of all the multiples of
#   another set of integers upto the given integer. If no set
#   provided, use 3 and 5
# - Default => 3 and 5

# Examples/Test Cases
# - See test file
# - upto 10, no set given, sum(3, 5, 6, 9)
# - upto 15, for 4 and 6, sum(4, 6, 8, 12)

# Data
# - Class => SumOfMultiples
# - Methods
#   - new(list of integers to find multiples, default 3 and 5)
#   - to(limit_integer) => class method
# - Instance methods:
#   - to(limit_integer)

# Code

class SumOfMultiples
  def initialize(*args)
    @set_of_numbers = args
  end

  def to(limit_integer)
    sum = 0
    0.upto(limit_integer - 1) do |integer|
      sum += integer if !@set_of_numbers.select do |sn|
        integer % sn == 0
      end.empty?
    end
    sum
  end

  def self.to(limit_integer)
    new(3, 5).to(limit_integer)
  end
end

# Start Time => 9:46
# End Time => 10:11
# Total Time => 25
