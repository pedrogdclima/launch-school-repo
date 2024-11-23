=begin
Part 1
Write a method that rotates an array by moving the first element to the end of the array.
The original array should not be modified.
Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
=end

def rotate_array(array)
  rotated_array = array[1..-1] << array[0]
end

alphabet = ["a","b","c","d","e","f"]
p rotated = rotate_array(alphabet)
p rotated2 = rotate_array(rotated)

=begin
Write a method that can rotate the last n digits of a number.

For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Note that rotating just 1 digit results in the original number being returned.

You may use the `rotate_array` method from the previous exercise if you want. (Recommended!)

You may assume that `n` is always a positive integer.
=end

def rotate_rightmost_digits(integer, n)
  integer_array = integer.to_s.chars
  right_part = integer_array[-n..-1]
  left_part = integer_array[0...-n]
  right_part = right_part[1..-1] << right_part[0]
  (left_part << right_part).flatten.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

=begin
If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining digits,
you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759.
Keep the first 3 digits fixed in place and rotate again to get 321597. Finally,
keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation
of that argument. You can (and probably should) use the `rotate_rightmost_digits`
method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

=end

# Algorithm
# - Rotate once through all elements
# - Rotate once through all but the first element
# - Rotate once through all but the first two elements



def max_rotation(integer)
  string_integer = integer.to_s
  rotated_string = integer
  string_integer.size.times do |idx|
    rotated_string = rotate_rightmost_digits(rotated_string,(string_integer.size-idx))
  end
  rotated_string
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845