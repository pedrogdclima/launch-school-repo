=begin
Mad libs are a simple game where you create a story template with blanks
for words. You, or another player, then construct a list of words and
place them into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an
adjective, and an adverb and injects those into a story that you create.

Example

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

=end

def get_word()
    input = gets.chomp
    input
end

words_hash = {
    noun: "",
    verb: "",
    adjective: "",
    adverb: ""
}

words_hash.each do |key, value|
    puts "Give me a #{key.to_s}!"
    words_hash[key] = get_word
end

puts "Do you #{words_hash[:verb]} your #{words_hash[:adjective]} #{words_hash[:noun]} #{words_hash[:adverb]}?"