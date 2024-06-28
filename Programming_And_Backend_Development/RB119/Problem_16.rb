=begin
Create a method that returns the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. You may assume that the input string contains only alphanumeric characters.

The tests below should each print true.
=end

# Problem
# -For a given string return the number of characters that occur more than once
# -Case-insensitive
# -String contains only alphanumeric characters

# Data
# -Hash to count frequencies

# Algorithm
# -Downcase string
# -Iterate over string .each_char and either
#  - += 1 to value if k,v pair exists
#  -create k,v pair for that character
# -.select for values over 1
# -return number of pairs

def distinct_multiples(string)
    frequency_hash = {}
    string.downcase.each_char do |char|
        if frequency_hash.key?(char)
            frequency_hash[char] += 1
        else
            frequency_hash[char] = 1
        end
    end
    frequency_hash.select{|k,v| v > 1}.size
end

p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5

# 13 minutes - 26.06.2024