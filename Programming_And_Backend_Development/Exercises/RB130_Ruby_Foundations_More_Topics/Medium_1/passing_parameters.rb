=begin
Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |elements| puts "#{items.join(', ')}" }

=begin
Ruby gives us a lot of flexibility when assigning arrays to variables. If we want to assign the entire array to a single variable, we can do that:

birds = %w(raven finch hawk eagle)
p birds # => ['raven','finch','hawk','eagle']

If we want to assign every element to a separate variable, we can do that too:

raven, finch, hawk, eagle = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p hawk # => 'hawk'
p eagle # => 'eagle'

Suppose we want to organize our array contents into groups, where variables represent category names. Can we do that without extracting items directly from the array based on their indices?

We can use the splat operator(*) to do something like this:

raven, finch, *raptors = %w(raven finch hawk eagle)
p raven # => 'raven'
p finch # => 'finch'
p raptors  # => ['hawk','eagle']

Based on the examples shown above, write a method that takes an array as an argument. The method should yield the contents of the array to a block, which should assign your block parameters in such a way that it ignores the first two elements, and groups all remaining elements as a raptors array.
=end

def my_method(array)
  yield(array)
end

array = ["sparrow", "loon", "eastern screech-owl", "peregrine falcon", "american kestrel"]

my_method(array) { |_,_,*args| puts args}

=begin
Given the code below, fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1)

gather(items) do |*args, last|
  puts args.join(", ")
  puts last
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2)

gather(items) do |first, *args, last|
  puts first
  puts args.join(", ")
  puts last
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# 3)

gather(items) do |first, *args|
  puts first
  puts args.join(", ")
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4)

gather(items) do |first, second, third, fourth|
  puts "#{first}, #{second}, #{third}, and #{fourth}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

# 5) (my own extra test)

gather(items) do |args|
  p *args
end
