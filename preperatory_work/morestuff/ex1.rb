#Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word.
#"laboratory"
#"experiment"
#"Pans Labyrinth"
#"elaborate"
#"polar bear"

words = ["laboratory","experiment","Pans Labyrinth","elaborate","polar bear"]

words.each do |word|
  if word =~ /lab/ || word =~ /Lab/
    puts word
  else
    next
  end
end