=begin
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.
=end

def triangle(*lengths)
  lengths.sort!
  return :invalid if invalid_triangle?(lengths)
  return :equilateral if lengths.uniq.size == 1
  return :isosceles if lengths.uniq.size == 2
  :scalene
end

def invalid_triangle?(lengths)
  lengths.any? { |length| length <= 0 } || invalid_lengths?(lengths)
end

def invalid_lengths?(length)
  length[0, 2].sum <= length[2]
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
