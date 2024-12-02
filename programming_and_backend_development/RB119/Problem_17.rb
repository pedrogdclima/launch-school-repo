=begin
Create a method that takes an array of integers as an argument. The method should determine the minimum integer value that can be appended to the array so the sum of all the elements equal the closest prime number that is greater than the current sum of the numbers. For example, the numbers in [1, 2, 3] sum to 6. The nearest prime number greater than 6 is 7. Thus, we can add 1 to the array to sum to 7.

Notes:
- The array will always contain at least 2 integers.
- All values in the array must be positive (> 0).
- There may be multiple occurrences of the various numbers in the array.

The tests below should each print true.
=end

def prime?(integer)
    divisible_array = (1..integer).to_a.select{|i| integer%i == 0}
    divisible_array.size > 2? false : true
end

def nearest_prime_sum(array_of_integers)
    sum_of_integers = array_of_integers.sum
    required_integer = false
    additional_integer = 1
    while required_integer == false
        if prime?(additional_integer + sum_of_integers)
            required_integer = true
            next
        else
            additional_integer += 1
        end
    end
    additional_integer
end


p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4

# 27 minutes - 26.06.2024