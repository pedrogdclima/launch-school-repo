# require_relative 'users'
require 'yaml'

@all_data = YAML.load_file("users.yaml")
# @names = @all_data.keys
# p all_data

@names_list = @all_data.keys.map(&:to_s).map(&:capitalize)

p @names_list

def count_initerests(data)
  data.each_with_object([]) do |(user_k, user_v), interests_list|
    # p user_k, user_v, interests
    interests_list << user_v[:interests]
  end.flatten.size
end

# p count_initerests(@all_data)

# {
#   :jamy=>{
#     :email=>"jamy.rustenburg@gmail.com",
#     :interests=>["woodworking", "cooking", "reading"]
#   },
#   :nora=>{
#     :email=>"nora.alnes@yahoo.com",
#     :interests=>["cycling", "basketball", "economics"]
#   },
#   :hiroko=>{
#     :email=>"hiroko.ohara@hotmail.com",
#     :interests=>["politics", "history", "birding"]
#   }
# }