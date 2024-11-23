=begin
A circular buffer is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle. When an object is added to this circular buffer, it is added to the position that immediately follows the most recently added object, while removing an object always removes the object that has been in the buffer the longest.

This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object to the buffer requires getting rid of an existing object; with a circular buffer, the object that has been in the buffer the longest is discarded and replaced by the new object.


Your task is to write a CircularBuffer class that implements a circular buffer for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularBuffer::new, and should provide the following methods:

put to add an object to the buffer
get to remove (and return) the oldest object in the buffer. It should return nil if the buffer is empty.
You may assume that none of the values stored in the buffer are nil (however, nil may be used to designate empty spots in the buffer).
=end

class CircularBuffer

  def initialize(size)
    @buffer = [nil]*size
    @next_position = 0
    @oldest_position = 0
  end

  def put(input)
    unless @buffer[@next_position].nil?
      @oldest_position = increment(@oldest_position)
    end
    @buffer[@next_position] = input
    @next_position = increment(@next_position)
  end

  def get
    output = @buffer[@oldest_position]
    @buffer[@oldest_position] = nil
    @oldest_position = increment(@oldest_position) unless output.nil?
    output
  end

  def increment(position)
    (position + 1) % @buffer.size
  end
end

buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil