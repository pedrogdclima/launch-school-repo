
def select(array)
  output_array = []
  index = 0
  while index < array.size do
    output_array << array[index] if yield(array[index])
    index += 1
  end

  output_array
end

p select(["racecar", "car", "hannah", "pedro", "lol"]) {|e| e == e.reverse}
