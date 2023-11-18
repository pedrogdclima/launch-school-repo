#Use Ruby's Array method delete_if and String method start_with? to delete all of the strings that begin with an "s" in the following array.

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

#Then recreate the arr and get rid of all of the strings that start with "s" or start with "w".

print arr

print "\n"

print arr.delete_if{|s| s.start_with?("s")}

print "\n"

print arr.delete_if{|s| s.start_with?("s") || s.start_with?("w")}
