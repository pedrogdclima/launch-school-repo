=begin
Create a method that takes an array of integers as an argument and returns the integer that appears an odd number of times. There will always be exactly one such integer in the input array.

The tests below should each print true.
=end

# Problem
# -For a given array of integers, return the integer that appears an odd number of times
# -Guaranteed exactly one integer

# Data
# -Frequency count
# -Hash to store frequency

# Algorithm
# -Create hash by iterating over array to make key-value pairs representing the frequency of each integer
# -Use .select to find keep the .odd? value and return the key

# Code

def odd_fellow(array_of_integers)
    frequency_hash = {}
    array_of_integers.each do |integer|
        if frequency_hash.key?(integer)
            frequency_hash[integer] += 1
        else
            frequency_hash[integer] = 1
        end
    end
    correct_integer = frequency_hash.select{|key,value| value.odd?}.keys[0]
end

p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0

# 10 minutes - 26.06.2024