=begin
Create a method that takes an array of numbers as an argument. For each number, determine how many numbers in the array are smaller than it, and place the answer in an array. Return the resulting array.

When counting numbers, only count unique values. That is, if a number occurs multiple times in the array, it should only be counted once.

The tests below should each print true.
=end

=begin
P Problem
  -Method that takes an array of numbers and returns a new array where each element is the number of values smaller than their value from the original array

E Examples/Test Cases
  -Below

D Data Structure
  
A Algorithm
  -One method will take a number, select numbers that are smaller than it from original array, and return the sixe of the selected array.
  -Next method will iterate over iput array, sending each element to the previous array and receiving it's smaller than count and will >> into new array.
C Code
=end

def smaller_numbers_than_current(array_of_values)
    array_of_smaller_count = []
    array_of_values.each do |e|
        array_of_smaller_count << number_counting(e, array_of_values)
    end
    return array_of_smaller_count
end

def number_counting(number, array_to_be_counted)
    selected_array = array_to_be_counted.uniq.select{|e| e < number}
    count = selected_array.size
    return count
end

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result

# 31 minutes - 11.03.2024