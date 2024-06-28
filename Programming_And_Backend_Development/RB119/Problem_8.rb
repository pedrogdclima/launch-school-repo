=begin
Create a method that takes a non-empty string as an argument. The string consists entirely of lowercase alphabetic characters. The method should return the length of the longest vowel substring. The vowels of interest are "a", "e", "i", "o", and "u".

The tests below should each print true.
=end

# Problem
# -For a given non-empty string, return the count of consecutive vowels.

# Data
# -Vowels assigned in a constant variable
# -Array_of_counts
# -Current_counter

# Algorithm
# -Use .each_char to iterate through given string
# -If current character is a consonent, next
#  -If vowel, add one two counter variable
=begin
Start new count if first vowel
Save count and set to zero
Add one to count if previous letter was vowel
=end

# Code

def longest_vowel_substring(string)
    string_array = string.chars
    current_counter = 0
    array_of_counts = []
    string_array.each do |char|
        if !VOWELS.any?(char)
            array_of_counts << current_counter
            current_counter = 0
        else
            current_counter += 1
        end
    end
    array_of_counts << current_counter
    array_of_counts.max
end

VOWELS = ["a","e","i","o","u"]
#CONSONENTS = ("a".."z").to_a.reject{|letter|VOWELS.any?(letter)}

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5

=begin
First 'working' version


def longest_vowel_substring(string)
    filtered_string = string.chars.map{|letter|
        if VOWELS.any?(letter)
            letter
        else
            "n"
        end}
    filtered_string.join.split("n").map{|l|l.length}.max
end
=end
