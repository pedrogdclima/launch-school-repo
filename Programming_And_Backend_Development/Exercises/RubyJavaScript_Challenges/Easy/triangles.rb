=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.
=end

=begin
Problem
- Identify what type of triangle would be created from the provided three lenths
- The three types are:
  - Equilateral -> all three sides are equal
  - Isosceles -> exactyl two sides are equal
  - Scalene -> no sides are equal
- Invalid inputs:
  - length is <= o
  - any length is larger than the other two summed up

Examples
Triangle.new(10, 10, 10).kind == "equilateral" => true
Triangle.new(5, 5, 10).kind == "isosceles" => true

Data
- We have one class, Triangle
  - With methods
  - .kind
  - .new

Algorithm


Code
=end

class Triangle
  attr_reader :lengths

  def initialize(*lengths)
    @lengths = *lengths
    raise ArgumentError unless valid_inputs
  end

  def valid_inputs
    valid = true
    lengths.each do |length|
      if length >= (lengths.sum - length)
        valid = false
      end
    end
    valid
  end

  def equilateral?
    true if lengths[0] == lengths[1] && lengths[1] == lengths[2]
  end

  def isosceles?
    true if lengths.uniq.size == 2
  end

  def kind
    return "equilateral" if equilateral?
    return "isosceles" if isosceles?
    "scalene"
  end
end

# p Triangle.new(2,2,2).kind
# p Triangle.new(9,5,5).kind

# Start time => 4:44
# End time => 5:15
# Total time => 21