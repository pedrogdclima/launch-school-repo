=begin
Create a method that takes a nonempty string as an argument and returns an array consisting of a string and an integer. If we call the string argument s, the string component of the returned array t, and the integer component of the returned array k, then s, t, and k must be related to each other such that s == t * k. The values of t and k should be the shortest possible substring and the largest possible repeat count that satisfies this equation.

You may assume that the string argument consists entirely of lowercase alphabetic letters.

The tests below should each print true.
=end

# Problem
# -

# Data
# -

# Code

def repeated_substring(string)
    substring_frequency = {}
    substring = string.dup
    until substring.empty? == true
        substring_frequency[substring] = string.scan(substring).size
        substring.chop!
    end
    hash_solution = substring_frequency.
        select { |k,v| string.length == k.length * v }.
        select{|k,v| v == substring_frequency.values.max}.
        to_a.flatten
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]

