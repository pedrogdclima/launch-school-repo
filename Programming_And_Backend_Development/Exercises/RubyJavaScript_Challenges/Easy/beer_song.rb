class BeerSong
  def self.verse(number)
    make_line(number)
  end

  def self.verses(start, finish)
    output = ""
    until start < finish
      output.concat(make_line(start))
      output.concat("\n") unless start == finish
      start -= 1
    end
    output
  end

  def self.lyrics
    verses(99, 0)
  end

  def self.make_line(number) # rubocop: disable Metrics/MethodLength
    case number
    when 3..99
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number - 1} bottles of beer " \
      "on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer " \
      "on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
