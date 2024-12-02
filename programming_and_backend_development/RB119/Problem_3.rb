=begin
Create a method that takes a string argument and returns a copy of the string with every second character in every third word converted to uppercase. Other characters should remain the same.

The tests below should each print true.
=end

# Problem
# Given a string, capitalize every second character, of every third word.

#Example/Test Cases

# original = 'Lorem Ipsum is simply dummy text of the printing world'
# expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
# p to_weird_case(original) == expected

# original = 'It is a long established fact that a reader will be distracted'
# expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case(original) == expected

# p to_weird_case('aaA bB c') == 'aaA bB c'

# original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
# expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
# p to_weird_case(original) == expected

# Data Strcuture
# Break up string into array of strings where each element is a word
# Use index of such array to find third words
# Use index of strings to find every other character and capitalize
# Two separate methods

# Algorithm
# Split string sentence into array of words
# Call iterative method to parse through elements and call capitalizing method on every third element
# Capitalizing method will take a word, find it's length, use it's length to capitalize every other character, and return modified string.

# Code

def to_weird_case(sentence)
    array_of_words = sentence.split
    array_of_words.map do |word|
        next if (array_of_words.index(word)+1) % 3 != 0
        capitalize_odd_index(word)
    end
    array_of_words.join(" ")
end

def capitalize_odd_index(word)
    word.length.times do |index|
        next if index.even?
        word[index] = word[index].capitalize
    end
    word
end

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"

p to_weird_case(original) == expected

# 30 minutes - 14.06.2024