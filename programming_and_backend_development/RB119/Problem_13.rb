=begin
Create a method that takes two strings as arguments and returns true if some portion of the characters in the first string can be rearranged to match the characters in the second. Otherwise, the method should return false.

You may assume that both string arguments only contain lowercase alphabetic characters. Neither string will be empty.

The test below should each print 'true'.
=end

# Problem
# -For two griven strings, return `true` if there is a match for each character in the second string from the first string
# -Both string are never empty, and only have lowercase alphabetic characters

# Data
# -Array for 2nd string to iterate over and keep track of matched letters -> [["c",false]["o",true]...]

# Algorithm
# Method to create data array
# Method to check letter matches
# -Iterate over data array, changing false to true if we find a match in 1st string, and remove said character
# -If there are no false, return true

def unscramble(string_1, string_2)
    checking_array = make_2nd_string_array(string_2)
    checking_array.map! do |letter_array|
        if string_1.match?(letter_array[0])
            string_1.sub!(letter_array[0], "*")
            letter_array[1] = true
            letter_array
        else
            letter_array
        end
    end
    return (checking_array.any?{|e|e[1] == false}? false : true)
end

def make_2nd_string_array(string)
    array = []
    string.each_char {|c|array << [c,false]}
    array
end

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true

# 30 minutes - 21.06.2024