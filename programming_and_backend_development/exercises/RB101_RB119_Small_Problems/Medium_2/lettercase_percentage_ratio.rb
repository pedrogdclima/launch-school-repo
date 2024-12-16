=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.
=end

UPPERCASE = ("A".."Z")
LOWERCASE = ("a".."z")

def letter_percentages(string)
  denominator = string.size.to_f
  output_hash = {lowercase: 0.to_f, uppercase: 0.to_f, neither: 0.to_f}
  string.each_char do |char|
    case char
    when UPPERCASE
      output_hash[:uppercase] += 1
    when LOWERCASE
      output_hash[:lowercase] += 1
    else
      output_hash[:neither] += 1
    end
  end
  output_hash.transform_values do |value|
    value / denominator * 100
  end
end

p letter_percentages('abCdef 123') == 
  { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == 
  { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == 
  { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
