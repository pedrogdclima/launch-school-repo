=begin
Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.
=end

class Anagram
  def initialize(string)
    @string = string
  end

  def match(input_array)
    input_array.select do |input|
      if input.length == @string.length &&
         input.downcase.chars.sort == @string.downcase.chars.sort &&
         input.downcase != @string.downcase
         true
      else
        false
      end
    end
    # return array with anagrams of string from input_array
  end
end

#p Anagram.new("potato").match(["a", "patoto", "Potato", "potato"])

# Start time => 1:40
# End time => 1:51