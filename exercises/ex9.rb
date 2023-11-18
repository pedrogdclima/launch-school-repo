#Suppose you have a hash h = {a:1, b:2, c:3, d:4}

h = {a:1,b:2,c:3,d:4}

#1. Get the value of key `:b`.
puts h[:b]

#2. Add to this hash the key:value pair `{e:5}`
print h
print "\n"
h[:e]=5
print h
print "\n"

#3. Remove all key:value pairs whose value is less than 3.5
hmorethan3andahalf = h.select{|k,v|v>3}
print hmorethan3andahalf
print "\n"
