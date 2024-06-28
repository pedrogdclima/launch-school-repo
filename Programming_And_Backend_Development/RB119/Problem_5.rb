=begin
Create a method that takes a string argument and returns the character that occurs most often in the string. If there are multiple characters with the same greatest frequency, return the one that appears first in the string. When counting characters, consider uppercase and lowercase versions to be the same.

The tests below should each print true.
=end

# Problem

# For a given string, return the most frequent character
# If there is a tie, return the character that occurs first

# Examples/Test Cases

# p most_common_char('Hello World') == 'l'
# p most_common_char('Mississippi') == 'i'
# p most_common_char('Happy birthday!') == 'h'
# p most_common_char('aaaaaAAAA') == 'a'

# my_str = 'Peter Piper picked a peck of pickled peppers.'
# p most_common_char(my_str) == 'p'

# my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
# p most_common_char(my_str) == 'e'

# Data
#  -String to array of characters
#  -Create hash to count frequency of characters -> {"a" => 2, "h" => 1}

# Algorithm
#  -Break string into array with .char
#  -Iterate over array of letters, makeing new letter into k-v pairs, and adding one to value if k-v for letter already exists
#  -Return key with largest value

# Code

def most_common_char(string)
    array_of_characters = string.chars.map{|chr|chr.downcase}
    frequency_hash = {}
    array_of_characters.each_with_object(frequency_hash) do |character|
        if frequency_hash.keys.any?(character)
            frequency_hash[character] += 1
        else
            frequency_hash[character] = 1
        end
    end
    frequency_hash.key(frequency_hash.values.max)
end

p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'

# 20 minutes - 19.06.2024