
require 'minitest/autorun'
require_relative 'swap_letters'

class TextTest < Minitest::Test

  def setup
    @file_obj = File.new('sample_text.txt')
    @text_obj = Text.new(@file_obj.read)
    @text_string = 
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.\n" \
      "Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat\n" \
      "quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo\n" \
      "nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum\n" \
      "dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras\n" \
      "et varius mauris, at pharetra mi."
  end

  def test_swap
    letter_one = "a"
    letter_two = "e"
    new_string = @text_obj.swap(letter_one, letter_two)
    assert_equal @text_string.size, new_string.size
    refute_equal  @text_string, new_string
  end

  def test_word_count
    assert_equal = 72, @text_obj.word_count
  end

  def teardown
    @file_obj.close
  end
end
