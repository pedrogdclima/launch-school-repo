# rubocop:disable Layout/LineLength
=begin
Create a custom set type.

Sometimes it is necessary to define a custom data structure of some type, like a set. In this exercise you will define your own set type. How it works internally doesn't matter, as long as it behaves like a set of unique elements that can be manipulated in several well defined ways.

In some languages, including Ruby and JavaScript, there is a built-in Set type. For this problem, you're expected to implement your own custom set type. Once you've reached a solution, feel free to play around with using the built-in implementation of Set.

For simplicity, you may assume that all elements of a set must be numbers.
=end

# Problem
# - Create a custom class that gives us a custom Set Class
# - Element of any particular set will be integers (in this qtn)
#   - Will be unique, no duplicates
#   - Are not kept in any order
# - Sets have a public interface, methods listed below

# Examples/Test Cases
# - Methods => .new, .empty?, .contains?, .subset?, .disjoint?
#              .eql?, .add, .intersection, .difference, .union

# Data
# - Given the unordered nature of sets, and their no-duplicates
#     characteristic, I'll use hashes to contain all of the elements
#     of a set

# Algorithm
# - build iterative method for class

# Code
# rubocop:enable Layout/LineLength

class CustomSet
  def initialize(array = nil)
    if array.is_a?(Hash)
      @elements = array
    else
      @elements = {}
      array&.each { |value| @elements[value] = value }
    end
  end

  def ==(other_set)
    elements == other_set.elements
  end

  def empty?
    elements.empty?
  end

  def contains?(value)
    elements.key?(value)
  end

  def subset?(other_set)
    output = true
    elements.each do |key, _|
      output = false unless other_set.elements.key?(key)
    end
    output
  end

  def disjoint?(other_set)
    output = true
    elements.each do |key, _|
      output = false if other_set.elements.key?(key)
    end
    output
  end

  def eql?(other_set)
    self == other_set
  end

  def add(value)
    elements.store(value, value)
    self
  end

  def intersection(other_set)
    new_set = CustomSet.new
    elements.each do |key, value|
      new_set.elements[key] = value if other_set.elements.key?(key)
    end
    new_set
  end

  def difference(other_set)
    new_set = CustomSet.new
    elements.each do |key, value|
      new_set.elements[key] = value unless other_set.elements.key?(key)
    end
    new_set
  end

  def union(other_set)
    CustomSet.new(elements.merge(other_set.elements))
  end

  protected

  attr_reader :elements
end

# Start time => 10:45
# End time => 11: 55
# Time => 1:10
