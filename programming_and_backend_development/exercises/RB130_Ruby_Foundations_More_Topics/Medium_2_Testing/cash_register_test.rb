
require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transactions'

class CashRegisterTest < Minitest::Test

  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(10)
  end

  def test_accept_money
    previous_total = @register.total_money
    @transaction.amount_paid = 10
    @register.accept_money(@transaction)
    assert_equal previous_total + 10, @register.total_money
  end

  def test_change
    @transaction.amount_paid = 15
    assert_equal 5, @register.change(@transaction)
  end

  def test_give_receipt
    expected_string = "You've paid $10.\n"
    assert_output expected_string do
       @register.give_receipt(@transaction)
    end
  end
end