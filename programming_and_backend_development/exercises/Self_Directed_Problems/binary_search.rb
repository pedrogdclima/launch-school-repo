require "pry"
=begin
Write your own method that performs a binary search for a given array
=end

def binary_search(array, lookup)
  min_idx = 0
  max_idx = (array.size - 1)
  counter = 0
  loop do
    mid_idx = (max_idx + min_idx) / 2
    if array[mid_idx] == lookup
      return mid_idx
    elsif array[mid_idx] < lookup
      min_idx = mid_idx + 1
    elsif array[mid_idx] > lookup
      max_idx = mid_idx - 1
    end
    data = [min_idx, max_idx, mid_idx]
    counter += 1
    # binding.pry
    if counter > 600
      puts "Limit reached"
      break
    end
  end
end

array = ("a".."z").to_a

p binary_search(array, "a")
