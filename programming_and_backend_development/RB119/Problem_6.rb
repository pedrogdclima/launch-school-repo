=begin
Create a method that takes a string argument and returns a hash in which the keys represent the lowercase letters in the string, and the values represent how often the corresponding letter occurs in the string.

The tests below should each print true.
=end

# Problem
# -For a given string, return a frequency hash for each lowercase letter
# -Ignore uppercase leters and any other characters

# Data
# -Frequency hash
# -2nd method to check if valid character

# Algorithm
# -Break string into array of characters with .chars
# -Iterate over array
#  -Check if valid character with 2nd method, if not `next`
#  -Check if k-v pair for letter already exists, if not, make one and set v to 1
#  -Add 1 to value
# -Return frequency hash


# Code

def count_letters(string)
    array_of_characters = string.chars
    frequency_hash = {}
    array_of_characters.each_with_object(frequency_hash) do |letter|
        next if countable_character(letter) == false
        if frequency_hash.keys.include?(letter)
            frequency_hash[letter] += 1
        else
            frequency_hash[letter] = 1
        end
    end
end

def countable_character(character)
    if ("a"..."z").to_a.include?(character)
        return character
    else
        return false
    end
end

expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
p count_letters('woebegone') == expected

expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
            'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
p count_letters('lowercase/uppercase') == expected

expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == {'x' => 1}
p count_letters('') == {}
p count_letters('!!!') == {}

# 14 minutes - 19.06.2024