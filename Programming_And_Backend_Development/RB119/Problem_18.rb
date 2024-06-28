=begin
Create a method that takes an array of integers as an argument. Determine and return the index N for which all numbers with an index less than N sum to the same value as the numbers with an index greater than N. If there is no index that would make this happen, return -1.

If you are given an array with multiple answers, return the index with the smallest value.

The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the numbers to the right of the last element is 0.

The tests below should each print true.
=end

# Problem
# -

def equal_sum_index(array_of_integers)
    array_of_indexies = (0...array_of_integers.size).to_a
    array_of_indexies.map! do |index|
        left_sum = array_of_integers[0...index].sum
        right_sum = array_of_integers[(index+1)..-1].sum
        if left_sum == right_sum
            true
        else
            false
        end
    end
    array_of_indexies.find_index(true)
end

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0

# 23 minutes for both solutions - 26.06.2024

=begin
First solution

def equal_sum_index(array_of_integers)
    solution_index = -1
    array_of_integers.each_with_index do |int, index|
        if array_of_integers[0...index].sum == array_of_integers[(index + 1)..-1].sum
            solution_index = index
            
        end
    end
    solution_index
end
=end