=begin
A great way to learn about blocks is to implement some of the core Ruby methods that use blocks using your own code. Over this exercise and the next several exercises, we will do this for a variety of different standard methods.

The Enumerable#any? method processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a truthy value for any element, then #any? returns true. Otherwise, #any? returns false. Note in particular that #any? will stop searching the collection the first time the block returns true.

Write a method called any? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for any of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true.

If the Array is empty, any? should return false, regardless of how the block is defined.

Your method may not use any standard Ruby method that is named all?, any?, none?, or one?.
=end

# .any?

def any?(array, &block)
  array.each do |element|
    return true if block.call(element)
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

# .all?

# def all?(array)
#   array.each do |element|
#     return false unless yield(element)
#   end
#   true
# end

def all?(collection)
  collection.each { |item| return false unless yield(item) }
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true

# .none?

# def none? (array)
#   array.each do |element|
#     return false if yield(element)
#   end
#   true
# end

def none?(array, &block)
  !any?(array, &block)
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true

# .one?

def one?(array, how_many = 1)
  counted = false
  array.each do |element|
    next unless yield(element)
    return false if counted
    counted = true
  end
  counted
end

# def one?(array, how_many = 1)
#   count = 0
#   output = count == how_many
#   array.each do |element|
#     next unless yield(element)
#     count += 1
#     return false if count > how_many
#   end
#   output
# end

p one?([1, 3, 5, 6]) { |value| value.even? } == true
p one?([1, 3, 5, 7]) { |value| value.odd? } == false
p one?([2, 4, 6, 8]) { |value| value.even? } == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true } == false
p one?([1, 3, 5, 7]) { |value| false } == false
p one?([]) { |value| true } == false