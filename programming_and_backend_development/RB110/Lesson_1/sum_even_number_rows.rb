# Imagine a sequence of consecutive even integers beginnnig with 2. The integers
# are grouped in rows, with the first row containing one integer, the second row
# two integers, the third row three integers, and so on. Given an integer
# representing the number of a particular row, return an integer representing the
# sum of all the integers in that row.

=begin

-rows are arrays with defined size containing consecutive even numbers
-take input number to determine with array to sum

Create array of consecutive numbers starting with two and ending with input number

select only even numbers

sum array adn return value

=end
puts "What is the input number?"

input_num = gets.chomp.to_i

# construct the following using the input number
# 1 -> 2
# 2 -> 4, 6
# 3 -> 8, 10, 12
# 4 -> 14, 16, 18, 20
# 5 -> 22, 24, 26, 28, 30
# 6 -> 32, 34, 36, 38, 40, 42

# largest number is equal to input number * (input_number + 1)
largest_num = input_num * (input_num + 1)

even_array = (2..largest_num).to_a.delete_if{|e| e.odd?}

row = even_array.last(input_num)

result = row.sum

p result