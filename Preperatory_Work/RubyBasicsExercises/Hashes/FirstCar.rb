car = {
  "type" => "sedan",
  "color" => "blue",
  "milage" => "80_000"
}

puts car

car["year"] = "2003"

puts car

car.delete("milage")

puts car

puts car["color"]