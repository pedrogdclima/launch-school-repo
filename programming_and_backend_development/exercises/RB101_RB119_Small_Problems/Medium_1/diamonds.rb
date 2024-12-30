=begin
Write a method that displays a 4-pointed diamond in an n x n grid,
where n is an odd integer that is supplied as an argument to the method.
You may assume that the argument will always be an odd integer.

Examples

diamond(1)

*

diamond(3)

 *
***
 *

 diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

=end

def diamond(size)
    diamond_top = make_top_half(size)
    puts diamond_top, diamond_top[0..-2].reverse
end

def make_top_half(size)
    lines = []
    1.upto(size) do |int|
        next if int.even?
        lines << "#{"*" * int}".center(size)
    end
    lines
end

diamond(9)