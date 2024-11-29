# Problem
# - Write a program that simulates the "x beers on the wall"

# Examples/Test Cases

# - BeerSong.verse(2)
# 2 bottles of beer on the wall, 2 bottles of beer.
# Take one down and pass it around, 1 bottle of beer on the wall.

# - BeerSong.verse(0)
# No more bottles of beer on the wall, no more bottles of beer.
# Go to the store and buy some more, 99 bottles of beer on the wall.

# - BeerSong.verse(2, 1)

# - BeerSong.lyrics

# Data
# Input => Some number of integers
# Output => Some number of strings, lines from the lyrics

# Algorithm
# - One class => BeerSong
#   - Class Methods => verse(*int), lyrics
# - Two set strings, last one and all others
# - If number is `0`, ouput last line, otherwise use int

# Code



class BeerSong
  def self.verse(start, finish = nil)
    output = ""
    if finish.nil?
      return output.concat(self.make_line(start))
    end
    (finish..start).to_a.reverse.each do |number|
      output << self.make_line(number)
    end
    output
  end

  def self.make_line(number)
    case number
    when 3..99
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number - 1} bottles of beer" \
      " on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer" \
      " on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def self.lyrics
    self.verse(99, 0)
  end
end

# Start Time => 5:20
# End Time => 