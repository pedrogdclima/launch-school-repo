require 'pry'

a = 'a'
#b = 'b'

def joiner(a)
  a += a
#  b += b
end

a = joiner(a)

puts a # a
#puts b # b
