require "pry"
=begin
Write a method that takes a sentence string as input, and returns the same
string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
=end

WORD_TO_DIGIT_HASH = {
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5"}

puts "Give me a string"
string = gets.chomp
puts "Thanks"
result = string.split.map do |word|
    if WORD_TO_DIGIT_HASH.keys.include?(word)
      return WORD_TO_DIGIT_HASH[word]
    else
      return word
    end
    binding.pry
  end

p result