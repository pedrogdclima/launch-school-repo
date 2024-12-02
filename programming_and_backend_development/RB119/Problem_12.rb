=begin
Create a method that takes a string as an argument and returns true if the string is a pangram, false if it is not.

Pangrams are sentences that contain every letter of the alphabet at least once. For example, the sentence "Five quacking zephyrs jolt my wax bed." is a pangram since it uses every letter at least once. Note that case is irrelevant.

The tests below should each print true.
=end

# Problem
# -Method should return `true` if the given string contains all ("a..z")
# -Ignore case

# Data
# Range object ("a..z")
# Boolean returns

# Algorithm
# -Downcase string
# -Iterate over alphabet_array, checking if each letter occurs in string
# -Return true if iteration passes all checks

# Code

def is_pangram(sentence)
    alphabet_array = ("a".."z").to_a
    pangram = true
    alphabet_array.each do |letter|
        if sentence.downcase.match?(letter)
            next
        else
            pangram = false
        end
    end
    pangram
end


p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard's job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true

# 23 minutes - 21.06.2024