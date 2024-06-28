=begin
Create a method that takes an array of integers as an argument and returns an array of two numbers that are closest together in value. If there are multiple pairs that are equally close, return the pair that occurs first in the array.

The tests below should each print true.
=end

# Problem

# Given an array of integers, return an array of the two closest numbers in value.
# If more than one pair is equally close, return the one that occurs first.

#Example/Test Cases

# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 22, 7, 17]) == [12, 7]

# Data Structure

# Working with arrays and integers
# Going to use variables to hold 'current' pair to be compared to first pair and keep smallest value

# Algorithm

# One method will take two numbers, and return the difference
# One method 
# Subtract one number from the other, square and root to 'remove' negatives -> (((-6)**2)**0.5).to_i
#   Next if '0'

# Code

def calc_difference(a,b)
    diff = a-b
    diff = (((diff)**2)**0.5).to_i
end

def closest_numbers(array)
    smallest_difference = array.max
    number_one = nil
    number_two = nil
    array.each_with_index do |first_number, first_index|
        array.each_with_index do |second_number, second_index|
            next if first_index == second_index
            
            current_diff = calc_difference(first_number, second_number)
            if current_diff > smallest_difference
                next
            elsif current_diff == smallest_difference
                next
            else
                smallest_difference = current_diff
                number_one = first_number
                number_two = second_number
            end
        end
    end
    [number_one, number_two]
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]

p closest_numbers([5, 25, 15, 11, 20])
p closest_numbers([19, 25, 32, 4, 27, 16])
p closest_numbers([12, 22, 7, 17])
p closest_numbers([1,5,8,8,16])

# 30 minutes - 14.06.2024