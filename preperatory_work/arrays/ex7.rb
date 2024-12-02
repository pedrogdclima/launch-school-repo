#Arrays Exercise 7
#Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.

arr = ["Ardvark","Bonobo","Cat","Dog","Elephant","Flamingo"]

arr.each_with_index{|item,index| puts "For index #{index}, the value is #{item}!"}

puts "We are done!"