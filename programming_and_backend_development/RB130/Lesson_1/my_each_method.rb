
def each(array)

  index = 0
  
  while index < array.size do
    yield(array[index])
    index += 1
  end

  array
end

each([1, 2, 3]) do |num|
  puts num
end
