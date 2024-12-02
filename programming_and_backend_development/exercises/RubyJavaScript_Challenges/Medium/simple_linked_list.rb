
class Element
  def initialize (value, following_element = nil)
    @value = value
    @following_element = following_element
  end

  def datum
    @value
  end

  def tail?
    @following_element == nil
  end

  def next
    @following_element
  end
end

class SimpleLinkedList

  def initialize
    @stack = []
  end

  def size
    @stack.size
  end

  def push(data)
    # Creates a new element from the argument
    # Makes the new element the head of the list
    element = Element.new(data, @stack[0])
    @stack.unshift(element)
  end

  def peek
    # Returns the value of the head element
    empty? ? nil : @stack[0].datum
  end

  def empty?
    @stack.empty?
  end

  def head
    @stack[0]
    # Returns the head element
  end

  def pop
    # Removes the head element and returns it's value
    @stack.shift.datum
  end

  def to_a
    array = @stack.clone.map {|e| e.datum}
  end

  def reverse
    reverse_list = SimpleLinkedList.new
    @stack.each do |element|
      reverse_list.push(element.datum)
    end
    reverse_list
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    if array.is_a?(Array)
      array.reverse_each do |data|
        list.push(data)
      end
    end
    list
  end
end


# list = SimpleLinkedList.from_a(("a".."f").to_a)
# p list.head.next.datum
# p list.empty?
# p list.head.tail?
# p list.head.next.next.next.next.next.tail?
# p list.peek
