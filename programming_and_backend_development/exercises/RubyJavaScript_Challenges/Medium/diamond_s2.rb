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
  ALPHABET = ("A".."Z").to_a

  def self.make_diamond(input_letter)
    unless ALPHABET.include?(input_letter)
      m = "ArgumentError raised\n"\
          "The following input caused an error:\n"\
          "#{input_letter}"
      raise(ArgumentError, m)
    end
    new_diamond = new(input_letter)
    new_diamond.print_diamond
  rescue ArgumentError
    print m
  end

  def print_diamond
    diamond.join
  end

  private

  attr_reader :diamond

  def initialize(input_letter)
    @input_letter = input_letter
    create_all_lines
  end

  def create_all_lines
    @diamond = []
    ALPHABET[0].upto(@input_letter) do |line_letter|
      current_line = line_builder(line_letter)
      diamond << current_line
    end
    @diamond = diamond + diamond.reverse[1..-1]
  end

  def line_builder(line_letter)
    "".concat(whitespace(line_letter),
              line_letter,
              unless first_element?(line_letter)
                internalspace(line_letter) + line_letter
              end.to_s,
              whitespace(line_letter),
              "\n")
  end

  def first_element?(line_letter)
    line_letter == ALPHABET[0]
  end

  def whitespace(line_letter)
    " " * (ALPHABET.index(@input_letter) - ALPHABET.index(line_letter))
  end

  def internalspace(line_letter)
    return "" if line_letter == ALPHABET[0]
    " " * ((ALPHABET.index(line_letter) * 2) - 1)
  end
end

puts Diamond.make_diamond("F")
