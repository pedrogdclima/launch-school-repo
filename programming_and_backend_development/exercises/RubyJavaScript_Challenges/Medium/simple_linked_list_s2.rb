# rubocop:disable Layout/LineLength
=begin
Write a simple linked list implementation. The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures.

The simplest kind of linked list is a singly linked list. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).

Let's create a singly linked list whose elements may contain a range of data such as the numbers 1-10. Provide methods to reverse the linked list and convert a linked list to and from an array.
=end
# rubocop:enable Layout/LineLength

# Problem
# - Build a simple linked list. Last In, First Out
# - Don't use an array to build the list
# - Each element holds only a piece of data, an integer in this case
#  - And a pointer to the `next` element

# Examples
# - See test file

# Data
# - Two classes, `Element` and `SimpleLinkedList`
# - `Element` has methods:
#   .new(value, next_ele) =>
#   .datum                => returns elements value
#   .tail?                => returns true if there is no next, else false
#   .next                 => return next element, nil if none
# - `SimpleLinkedList` has methods:
#   .size         => return number of elements
#   .empty?       => return boolean, true if .size == 0
#   .push(value)  => adds element to list
#   .peek         => returns value of 'head' element
#   .head         => returns 'head' element
#   .pop          => removes element and returns it's value
#   .to_a         => returns an array of it's elements
#   .reverse      => returns a list object in inverse order

# Algorithm
# - Element objects seem simple enough
# - SimpleLinkedList will have to keep track
#   - Which element is the `head` element
#   - Change the `head` element when pop, is called

# Code

class Element
  def initialize(value, next_ele = nil)
    @value = value
    @next_ele = next_ele
  end

  def datum
    @value
  end

  def tail?
    @next_ele.nil?
  end

  def next
    @next_ele
  end
end

class SimpleLinkedList
  def initialize
    @head_ele = nil
  end

  def push(value)
    new_ele = Element.new(value, @head_ele)
    @head_ele = new_ele
  end

  def size
    return 0 if @head_ele.nil?
    counter = 1
    current_ele = @head_ele
    until current_ele.tail?
      counter += 1
      current_ele = current_ele.next
    end
    counter
  end

  def empty?
    @head_ele.nil?
  end

  def peek
    empty? ? nil : @head_ele.datum
  end

  def head
    @head_ele
  end

  def pop
    popped_ele = @head_ele
    @head_ele = @head_ele.next
    popped_ele.datum
  end

  def self.from_a(array)
    new_list = SimpleLinkedList.new
    return new_list if array.nil?
    array.reverse.each { |array_ele| new_list.push(array_ele) }
    new_list
  end

  def to_a
    output_array = []
    current_ele = @head_ele
    until current_ele.nil?
      output_array << current_ele.datum
      current_ele = current_ele.next
    end
    output_array
  end

  def reverse
    reversed_list = SimpleLinkedList.new
    current_ele = @head_ele
    until current_ele.nil?
      reversed_list.push(current_ele.datum)
      current_ele = current_ele.next
    end
    reversed_list
  end
end

# Start time => 2:48
# Pause => 3:43
# Unpause => 5:10
# End time => 5:16
# Time => 61 minutes
