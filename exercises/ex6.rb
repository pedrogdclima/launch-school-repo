#Get rid of duplicates without specifically removing any one value.

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.unshift(0)
arr.push(11)
print arr
print "\n"

arr.pop
arr.push(3)
print arr
print "\n"

arr.uniq!
print arr
print "\n"
