require 'minitest/autorun'

class EmployeeTest < Minitest::Test
  
  def test_hire
    assert_raises ArgumentError {Employee.new.hire}
  end
end
#   # def test_another
#   #   value = "example"
#   #   assert_equal "example", value
#   # end
# end

# class RaiseExceptionTest < MiniTest::Test
#   def test_exception
#     assert_raises ArgumentError do
#        Employee.new.hire
#     end
#     # do
#     #   employee = Employee.new
#     #   employee.hire
#     # end
#   end
# end

class Employee

  # def hire()
  #   raise ArgumentError
  # end

  def hire
    raise ArgumentError
  end
end