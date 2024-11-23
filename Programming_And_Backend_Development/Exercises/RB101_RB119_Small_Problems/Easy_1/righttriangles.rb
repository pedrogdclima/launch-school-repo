=begin
Write a method that takes a positive integer, n, as an argument, and displays a right
triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal
side in the images below) should have one end at the lower-left of the triangle,
and the other end at the upper-right.

Examples:

triangle(5)
    *
   **
  ***
 ****
*****

triangle(9)
        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

=end

# Problem
# - Print a triangle whose right and bottom side are the length of a provided integer

# Data
# - Input => Integer
# - Ouput => Print strings to terminal
#  - Total number of `puts` == integer size
#  - Decreasing number of ' ' and increasing number of '*'

# Algorithm
# - use .times to call `puts` the integer number of times
# - change the string to reflect a different number of ' ' and '*'
#  - first line will have a total length of input
#   - all but one are ' '
#  - second line will have all but two
#  - "#{' '*(integer - 1)}#{'*'*1}"

def triangle(side_size)
    side_size.times do |idx|
        puts "#{' '*(side_size - (idx - 1))}#{'*' * (idx + 1)}"
    end
end

triangle(5)

triangle(9)