=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do
not use both letters from any given block. Each letter in each block can only
be used once.

Write a method that returns true if the word passed in as an argument can be
spelled from this set of blocks, false otherwise.
=end

LETTER_BLOCKS = [
  %w(B O), %w(X K), %w(D Q), %w(C P), %w(N A), %w(G T), %w(R E), %w(F S),
  %w(J W), %w(H U), %w(V I), %w(L Y), %w(Z M)
  ]

def block_word?(string)
  input = string.upcase
  LETTER_BLOCKS.each do |block|
    counter = 0
    block.each do |letter|
      counter += 1 if input.include?(letter)
      return false if input.count(letter) > 1
    end
    return false if counter == 2
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('apples') == false
p block_word?('Baby') == false
