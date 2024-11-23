require 'minitest/autorun'
require_relative 'transactions.rb'

class TransactionTest < Minitest::Test

  def setup
    @transaction = Transaction.new(10)
  end

  def test_prompt_for_payment_unsuccessful
    expected_string =
      "You owe $10.\n" \
      "How much are you paying?\n" \
      "That is not the correct amount. " \
      "Please make sure to pay the full cost.\n" \
      "You owe $10.\n" \
      "How much are you paying?\n"
  
    #output = StringIO.new
    input = StringIO.new("-1\n" + "10\n")
    assert_output expected_string do
      @transaction.prompt_for_payment(input: input)
    end

    #output = StringIO.new
    input = StringIO.new("5\n" + "10\n")
    assert_output expected_string do
      @transaction.prompt_for_payment(input: input)
    end
  end

  # def test_prompt_for_payment_unsuccessful
  #   expected_string = ""
  
  #   output = StringIO.new
  #   input = StringIO.new("-1\n" + "10\n")
  #   assert_output expected_string do
  #     @transaction.prompt_for_payment(input: input, output: output)
  #   end

  #   output = StringIO.new
  #   input = StringIO.new("5\n" + "10\n")
  #   assert_output expected_string do
  #     @transaction.prompt_for_payment(input: input, output: output)
  #   end
  # end

  def test_prompt_for_payment_successful
    output = StringIO.new
    input = StringIO.new("15\n")
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal 15, @transaction.amount_paid
  end
end
