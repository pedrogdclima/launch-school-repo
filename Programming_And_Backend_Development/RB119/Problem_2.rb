=begin
Create a method that takes an array of integers as an argument.
The method should return the minimum sum of 5 consecutive numbers in the array.
If the array contains fewer than 5 elements, the method should return nil.

The tests below should each print true.
=end
# Problem

#Write method that takes an array of integers and returns the smallest sum that any 5 consecutive integers produce.
#Method should return nil if the array has fewer than 5 elements.

#Examples
# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

#Data Strucutre

#I'll be using a variable to hold a sum, to which the following sums will be compared to.
#I'll use a range object to retreive 5 consecutive elements to execute the sum -> (1...5)

#Algorithm

#First check for size of array and return nil if smaller than 5 elements.
#For a required number of times (TBD) retreive and sum the five elements and add the value to a holding array.
#After the array has been iterated over, return the smallest value in the holding array.
#TBD -> Number of iterations is equal to input_array.size minus 4
#Code

def minimum_sum(input_array)
    return nil if input_array.size < 5

    iterations = input_array.size - 4
    array_of_sums = []
    iterations.times do |e|
        array_of_sums << input_array[e..(e+4)].sum
    end
    array_of_sums.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# 24 minutes - 13.06.2024