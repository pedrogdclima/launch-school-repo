=begin
A double number is a number with an even number of digits whose left-side digits
are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676
are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the
argument is a double number; double numbers should be returned as-is.

Example:
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

=end

def twice(number)
  return number * 2 if number.to_s.size.odd?
  half_size = number.to_s.size / 2
  first_half = number.to_s.slice(0, half_size)
  second_half = number.to_s.slice(half_size, half_size)
  return number * 2 if first_half != second_half
  return number
end

p twice(4444)
