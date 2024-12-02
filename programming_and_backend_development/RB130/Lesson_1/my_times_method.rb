=begin
Define the following #times() method

times(5) do |num|
  puts num
end

so it behaves like the following built-in method

5.times do |num|
  puts num
end

=end

def times(arg)
  counter = 0
  while counter < arg do
    yield(counter)
    counter += 1
  end

  arg
end

times(5) do |num|
  puts num
end
