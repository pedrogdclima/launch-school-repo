=begin
Write a program that, given a word, computes the Scrabble score for that word.

You'll need the following tile scores:

A, E, I, O, U, L, N, R, S, T =>	1
D, G => 2
B, C, M, P => 3
F, H, V, W, Y => 4
K => 5
J, X => 8
Q, Z => 10

Sum the values of all the tiles used in each word. For instance, lets consider the word CABBAGE which has the following letters and point values:

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E
Thus, to compute the final total (14 points), we count:

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14
=end

# Problem
# - For a given string, return the integer score that string would produce in 
#   a game of Scrabble
# - 

# Example / Test Cases
# - Scrabble.new('CABBAGE') == 14
# - Scrabble.new(nil) == 0
# - Scrabble.new(' \t\n') == 0
# - case insensitive
# - always return an integer

# Data
# - One class, Scrabble
# - Create new instances for each submitted string
# - Instance method .score returns the sum of tile values
# - Split input string into array of characters => .chars
# - Use provided conversion in a hash

# Algorithm
# - guard clause for nil?
# - string to array of characters
# - call map and use the conversion hash to return character values
# - sum array and return the integer

class Scrabble

  CHAR_POINT = {
                1 => %w(A E I O U L N R S T),
                2 => %w(D G),
                3 => %w(B C W P),
                4 => %w(F H V W Y),
                5 => %w(K),
                8 => %w(J X),
                10 => %w(Q Z)}

  def self.score(string)
    new(string).score
  end

  def initialize(string)
    @characters = (string.nil? ? [nil] : string.upcase.chars)
  end

  def score
    @characters.map{|c|character_point(c)}.sum
  end

  def character_point(char)
    point = 0
    CHAR_POINT.each do |key, value|
      if value.include?(char)
        point = key
        break
      end
    end
    point
  end
end

p Scrabble.new("Nail").score
p Scrabble.new(nil).score

# Start time => 3:00
# End time => 3:44