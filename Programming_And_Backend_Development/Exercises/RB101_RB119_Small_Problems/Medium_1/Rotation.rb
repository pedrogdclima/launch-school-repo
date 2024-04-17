=begin
Write a method that rotates an array by moving the first element to the end of the array.
The original array should not be modified.
Do not use the method Array#rotate or Array#rotate! for your implementation.
=end

def rotate_array(array)
  array[1..-1] << array[0]
end

alphabet = ["a","b","c","d","e","f"]
p rotated = rotate_array(alphabet)
p rotated2 = rotate_array(rotated)