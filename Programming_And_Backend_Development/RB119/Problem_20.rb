=begin
Create a method that takes an array of numbers, all of which are the same except one. Find and return the number in the array that differs from all the rest.

The array will always contain at least 3 numbers, and there will always be exactly one number that is different.

The tests below should each print true.
=end

# Problem
# -For a given array of numbers, return the one that is different from the rest
# -Array will contain at least 3 numbers
# -There is only one answer

# Data
# 

def what_is_different(array_of_numbers)
    frequency_hash = {}
    array_of_numbers.each do |number|
        if frequency_hash.key?(number)
            frequency_hash[number] += 1
        else
            frequency_hash[number] = 1
        end
    end
    frequency_hash.select{|k,v| v==1}.keys[0]
end

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3

# 10 minutes - 26.06.2024