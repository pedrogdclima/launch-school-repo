# The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

#Observations:
#     The first row contains one 'A'.
#     The last row contains one 'A'.
#     All rows, except the first and last, have exactly two identical letters.
#     The diamond is horizontally symmetric.
#     The diamond is vertically symmetric.
#     The diamond has a square shape (width equals height).
#     The letters form a diamond shape.
#     The top half has the letters in ascending order.
#     The bottom half has the letters in descending order.
#     The four corners (containing the spaces) are triangles.

# Problem
# - Can assuming input will always be a single capital letter
# - Create guard cause for invalid strings
# - index of provided letter is equal to the number of lines in the triangle
# - The pattern for each letter is constant -> "B B", "C   C"
#   - The leading whitespace changes depending on the size of the triangle/diamond
#   - Leading whitespace for any line is equal to the input letter's index -1

# Diamond.make_diamond("C")

#   A
#  B B
# C   C
# re-print line 2
# re-print line 1

# A,1 -> 0
# B,2 -> 1
# C,3 -> 3
# D,4 -> 5
# E,5 -> 7
# F,6 -> 9
# number internal spaces = index of the line's letter -1 * 2 -1

# output = [line1, line2, line3, line2, line1].join("\n")

# require 'minitest/autorun'

# class DiamondTest < Minitest::Test
#   def test_letter_a
#     answer = Diamond.make_diamond('A')
#     assert_equal "A\n", answer
#   end

#   def test_letter_b
#     skip
#     answer = Diamond.make_diamond('B')
#     assert_equal " A \nB B\n A \n", answer
#   end

#   def test_letter_c
#     skip
#     answer = Diamond.make_diamond('C')
#     string = "  A  \n"\
#              " B B \n"\
#              "C   C\n"\
#              " B B \n"\
#              "  A  \n"
#     assert_equal string, answer
#   end

#   def test_letter_e
#     skip
#     answer = Diamond.make_diamond('E')
#     string = "    A    \n"\
#              "   B B   \n"\
#              "  C   C  \n"\
#              " D     D \n"\
#              "E       E\n"\
#              " D     D \n"\
#              "  C   C  \n"\
#              "   B B   \n"\
#              "    A    \n"
#     assert_equal string, answer
#   end
# end

class Diamond

  ALPHABET = ("A".."Z").to_a

  def self.make_diamond(letter)
    @@letter = letter
    raise ArgumentError, "Invalid input. Please provide A..Z" unless valid_input?
    letter_index = ALPHABET.index(@@letter)
    lines = []
    ALPHABET[0].upto(@@letter) do |line_letter|
      whitespace = " " * (letter_index - ALPHABET.index(line_letter))
      current_line = ""
      current_line.concat(whitespace, line_letter, internalspace(line_letter), second_line_letter(line_letter), whitespace, "\n")
      lines << current_line
    end
    # other_lines = []
    # ALPHABET[0].upto((@@letter.ord - 1).chr) do |line_letter|
    #   whitespace = " " * (letter_index - ALPHABET.index(line_letter))
    #   current_line = ""
    #   current_line.prepend(whitespace, line_letter, internalspace(line_letter), second_line_letter(line_letter), whitespace, "\n")
    #   other_lines << current_line
    # end

    (lines + lines[0..-2].reverse).join
  end

  private

  def self.second_line_letter(line_letter)
    line_letter == ALPHABET[0] ? "" : line_letter
  end

  def self.internalspace(line_letter)
    if line_letter == ALPHABET[0]
      "" 
    else 
      " " * ((ALPHABET.index(line_letter) * 2) - 1)
    end
  end

  def self.valid_input?
    ALPHABET.include?(@@letter) && @@letter.size == 1
  end
end

# puts Diamond.make_diamond("C")
