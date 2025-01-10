=begin
Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.
=end

def leading_substrings(string)
  string.chars.each_with_object([]).with_index do |args, index|
    args[1] << string[0..index]
  end
end

puts (leading_substrings('abc') == ['a', 'ab', 'abc']),
     (leading_substrings('a') == ['a']),
     (leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy'])
