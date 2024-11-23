require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'to_do_list'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_size
    assert_equal(3, @todos.size)
  end

  def test_first
    assert_equal(@todos[0], @todos.first)
    assert_equal(@todo1, @todos.first)
  end

  def test_last
    assert_equal(@todo3, @todos.last)
  end

  def test_shift
    todo = @todo1
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    # assert_equal(true, @list.mark_all_done.done?)
  end

  def test_raise_TypeError
    arr = ["string", 0, nil, true, :symbol, {a: 1}]
    arr.each {|e| assert_raises(TypeError) {@list.add(e)}}
  end

  def test_shovel
    @todo4 = Todo.new("Test")
    @list << @todo4
    assert_equal(@todos + [@todo4], @list.to_a)
  end

  def test_add
    @todo4 = Todo.new("Test")
    @list.add(@todo4)
    assert_equal(@todos + [@todo4], @list.to_a)
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1))    
    assert_raises(IndexError) {@list.item_at(3)}
  end

  def test_mark_done_at
    assert_raises(IndexError) {@list.mark_done_at(3)}
    assert_equal(!@todo1.done?, @list.mark_done_at(0))
  end

  def test_mark_undone_at
    assert_raises(IndexError) {@list.mark_undone_at(3)}
    assert_equal(@todo1.done?, @list.mark_undone_at(0))
  end

  def test_done_bang
    @list.done!
    [@todo1, @todo2, @todo3].each { |e| assert_equal(true, e.done?) }
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(3) }
    @list.remove_at(2)
    assert_equal(2, @list.size)
  end

  def test_to_s_1
    output = <<~OUTPUT.chomp
    ---Today's Todos---
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym\n
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<~HEREDOC.chomp
    ---Today's Todos---
    [ ] Buy milk
    [ ] Clean room
    [X] Go to gym\n
    HEREDOC

    @list.mark_done_at(2)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    
  end
end