=begin
Create a method that takes an array of integers as an argument and returns the number of identical pairs of integers in that array. For instance, the number of identical pairs in [1, 2, 3, 2, 1] is 2: there are two occurrences each of both 2 and 1.

If the array is empty or contains exactly one value, return 0.

If a certain number occurs more than twice, count each complete pair once. For instance, for [1, 1, 1, 1] and [2, 2, 2, 2, 2], the method should return 2. The first array contains two complete pairs while the second has an extra 2 that isn't part of the other two pairs.

The tests below should each print true.
=end

# Problem
# -For a given array of integers, return the number of complete pairs
# -Ignore 'leftover'/unpaired numbers

# Data
# -Variable to keep count of pairs

# Algorithm
# -Setup a variable to increment every time we find a complete pair
# -Iterate over array with .select to keep only values that are the same as the current element
# -Divide the .size of the resulting array by 2 and add that number to the complete_pair_variable

# Code

def pairs(array_of_integers)
    return 0 if array_of_integers.empty?
    number_of_pairs = 0
    array_of_integers.max.times do |index|
        integer_count = array_of_integers.select{|int|int == (index+1)}.size
        number_of_pairs += (integer_count/2)
    end
    number_of_pairs
end

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3

# 15 minutes - 19.06.2024