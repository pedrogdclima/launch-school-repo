=begin
The diamond exercise takes as its input a letter, and outputs it in a diamond
shape. Given a letter, it prints a diamond starting with 'A', with the
supplied letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.
=end

class Diamond
  def self.make_diamond(input_letter)
    new(input_letter).to_s
  end

  def initialize(input_letter)
    @input_letter = input_letter
    @input_letter_ord = input_letter.ord - 64
    @diamond_string = build_diamond
  end

  def to_s
    @diamond_string
  end

  def build_diamond
    output = []
    "A".upto(@input_letter) do |letter|
      output << build_line(letter)
    end
    (output + output[0..-2].reverse).join
  end

  def build_line(letter)
    line = "#{' ' * @input_letter_ord}\n"
    line[letter.ord - 65] = letter
    line.prepend(line[1..-2].reverse)
  end
end

# puts Diamond.make_diamond("D")

# Start Time => 3:55
# End Time => 4:37
# Time => 42
