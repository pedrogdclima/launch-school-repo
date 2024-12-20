=begin
Fill out the rest of the Ruby code below so it prints output like that shown in "Sample Output." You should read the text from a simple text file that you provide. (We also supply some example text below, but try the program with your text as well.)

This question requires that you read a simple text file. Try searching the Web for information on how to do this, and also take a look at the File class in the Ruby documentation. If you can't figure it out on your own, don't worry: just put the data directly into your program; an Array with one element per line would be ideal.

Read the text file in the #process method and pass the text to the block provided in each call. Everything you need to work on is either part of the #process method or part of the blocks. You need no other additions or changes.

The text you use does not have to produce the same numbers as the sample output but should have the indicated format.

Sample Output:
3 paragraphs
15 lines
126 words
=end

# class TextAnalyzer
#   def process
#     #text_array = yield.readlines
#     paragraph_count = 1
#     yield.each do |line|
#       paragraph_count += 1 if line == "\n"
#     end
#     line_count = 0
#     yield.each do |line|
#       line_count += 1
#     end
#     word_count = 0
#     yield.each do |line|
#       word_count += line.split.count
#     end
#     puts "#{paragraph_count} paragraphs\n#{line_count} lines\n#{word_count} words"
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process {File.new('sample_text.txt')}
# analyzer.process { # your implementation }
# analyzer.process { # your implementation }

#Second Attempt

class TextAnalyzer
  def process
    file = File.open('sample_text.txt')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |string| puts string.split("\n\n").count }
analyzer.process { |string| puts string.split("\n").count }
analyzer.process { |string| puts string.split.count }
