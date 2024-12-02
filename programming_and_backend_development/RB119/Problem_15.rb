=begin
Create a method that takes a string argument that consists entirely of numeric digits and computes the greatest product of four consecutive digits in the string. The argument will always have more than 4 digits.

The tests below should print true.
=end

# Problem
# -For a given string of digits, return the largest product of any four consecutive digits
# -Argument will always ahve more than 4 digits

# Data
# -String to integers
# -Build all possible four consecutive digits
# -Store in arrays

# Algorithm
# -Two methods
# -First method
#  -In a n sized string, there will be n-3 combinations
#  -(n-3).times using the index and shovel strings into array
# -Second method
#  -In an array, use .map to change each element to the product of its digits
#   -.chars
#  -Return the largest number

def create_consecutive_digits(string)
    array = []
    (string.length-3).times do |i|
        array << string[i..(i+3)]
    end
    array
end

def greatest_product(string)
    array_of_consecutive_digits = create_consecutive_digits(string)
    array_of_products = array_of_consecutive_digits.map do |string_of_digits|
        product = 1
        string_of_digits.chars.each{|digit| product *= digit.to_i}
        product
    end
    array_of_products.max
end

p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6

# 20 minutes - 26.06.2024