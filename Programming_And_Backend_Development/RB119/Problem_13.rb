=begin
Create a method that takes two strings as arguments and returns true if some portion of the characters in the first string can be rearranged to match the characters in the second. Otherwise, the method should return false.

You may assume that both string arguments only contain lowercase alphabetic characters. Neither string will be empty.

The test below should each print 'true'.
=end

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true