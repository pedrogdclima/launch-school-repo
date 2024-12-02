=begin
Create a method that takes two string arguments and returns the number of times that the second string occurs in the first string. Note that overlapping strings don't count: 'babab' contains 1 instance of 'bab', not 2.

You may assume that the second argument is never an empty string.

The tests below should each print true.
=end

# Problem
# -For two given strings, how many time does the second string occur in the first string
# -Ignore overlaps
# -Assume second string is never empty

# Data
# -Comparing strings using `==`

# Algorithm
# -Iterate using .each_with_index to go through the string

# Code

def count_substrings(string, comparisson)
    match_count = 0
    comparisson_length = comparisson.length
    string_array = string.chars
    string_array.each_with_index do |_, index|
        match_count += 1 if string_array[index, comparisson_length] == comparisson
    end
    match_count        
end

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

# 11 minutes - 19.06.2024