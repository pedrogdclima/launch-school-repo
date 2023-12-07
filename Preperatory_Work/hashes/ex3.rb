#Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys.
#Then write a program that does the same thing except printing the values.
#Finally, write a program that prints both.

teams = {
  "Sao Paulo" => "Corinthians",
  "Toronto" => "TFC",
  "Liverpool" => "Liverpool",
  "Dortmund" => "Borrusia",
  "Rio de Janeiro" => "Vasco",
  "Vancouver" => "Whitecaps",
  "Seatle" => "Reign"}

teams.each do |k,v|
  print k + " "
end

print "\n"

teams.each do |k,v|
  print v + " "
end

print "\n"

#teams.each do |k,v|
#  print 