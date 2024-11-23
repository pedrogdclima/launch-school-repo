
def reduce(collection, accumulator = 0)

  index = 0
  while index < collection.size do
    current_element = collection[index]
    accumulator = yield(accumulator, current_element)
    index += 1
  end

  accumulator
end

p reduce([10,20,30,40]){|acc, num| acc + num}