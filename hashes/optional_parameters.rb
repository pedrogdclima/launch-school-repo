#Learning how to setup optional parameters when working with hashses

def greeting(name, info={})
  if info.empty?
    puts "Hi #{name}! We don't seem to know much about you except that your name is #{name}!"
  else
    puts "Hi #{name}! We have the following info about you!"
    info.each {|key, value| puts "Your #{key} is #{value}."}
  end
end

greeting("Joe")

greeting("Pedro", age: 30, natality: "Toronto", height: "171 cm", weight: "60 kg")

