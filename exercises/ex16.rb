#Challenge: In exercise 11, we manually set the contacts hash values one by one.
#Now, programmatically loop or iterate over the contacts hash from exercise 11, and populate the associated data from the contact_data array.
#Hint: you will probably need to iterate over ([:email, :address, :phone]), and some helpful methods might be the Array shift and first methods.

#Note that this exercise is only concerned with dealing with 1 entry in the contacts hash, like this:
#contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
#contacts = {"Joe Smith" => {}}

#As a bonus, see if you can figure out how to make it work with multiple entries in the contacts hash.


contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contact_fields=[:email,:address,:phone]

loop do
  puts "What name should we work with?"
  name_entry = gets.chomp
  break if name_entry == "exit"
  for i in contact_fields
    contacts[name_entry][i]=contact_data[0].shift
  end
end

puts contacts



#contacts["Joe Smith"][:email] = contact_data[0][0]
#contacts["Joe Smith"][:address] = contact_data[0][1]
#contacts["Joe Smith"][:phone] = contact_data[0][2]

#contacts["Sally Johnson"][:email] = contact_data[1][0]
#contacts["Sally Johnson"][:address] = contact_data[1][1]
#contacts["Sally Johnson"][:phone] = contact_data[1][2]

#puts contacts