stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when "green"
  puts "Go!"
when "yellow"
  puts "Slow down!"
else "red"
  puts "Stop!"
end
