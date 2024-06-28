=begin
Create a method that takes a string of digits as an argument and returns the number of even-numbered substrings that can be formed. For example, in the case of '1432', the even-numbered substrings are '14', '1432', '4', '432', '32', and '2', for a total of 6 substrings.

If a substring occurs more than once, you should count each occurrence as a separate substring.

The tests below should each print true.
=end

# Problem
# -For a given string of digits, return the number of even substrings that can be made
# -If a digit can be made more than once, count every occurence

# Data
# -


# Algorithm
# -

# Code

def create_array(string)
    array = []
    string.length.times do |i|
        array << string[i..-1]
    end
    array
end

def even_substrings(string_of_digits)
    array_of_valid_substrings = []
    array_to_iterate = create_array(string_of_digits)
    array_to_iterate.each_with_index do |digit, _|
        digit.length.times do |_|  
            array_of_valid_substrings << digit if digit.to_i.even?
            digit.chop!
        end
    end
    array_of_valid_substrings.size            
end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12
