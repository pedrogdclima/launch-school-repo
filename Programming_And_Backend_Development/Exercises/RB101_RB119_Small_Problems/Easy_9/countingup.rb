=begin
Write a method that takes an integer argument, and returns an Array of all
integers, in sequence, between 1 and the argument.
You may assume that the argument will always be a valid integer that is
greater than 0.

Example:
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
=end

def sequence(number)
  output = []
  number.times do
    output.unshift(number)
    number -= 1
  end
  output
end

p sequence(6)