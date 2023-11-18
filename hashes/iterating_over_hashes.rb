#Learning how to iterate over hashes

pedro = {age: 30, height: "171 cm", natality: "Toronto", hair_colour: "Black", weight: "60 kilos"}


pedro.each do |key, value|
  puts "Pedro's #{key} is #{value}."
end

