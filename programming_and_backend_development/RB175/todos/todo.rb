require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"

configure do
  enable :sessions
  set :session_secret, SecureRandom.hex(32)
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

# Show all lists
get "/lists" do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# Show new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# Create a new list
post "/lists" do
  list_name = params[:list_name].strip

  error = add_error_message_if_name_invalid(list_name)

  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << { name: params[:list_name], todos: [] }
    session[:success] = "New list created"
    redirect "/lists"
  end
end

def add_error_message_if_name_invalid(name)
  if !(1..80).cover?(name.size)
    "Invalid input. Name must be between 1 and 80 characters long."
  elsif session[:lists].any? { |list| list[:name] == name }
    "Invalid input. Name must be unique."
  end
end

# <a href="/lists/<%= index %>">

get "/lists/:index" do
  @list = session[:lists][params[:index].to_i]
  erb :todos, layout: :layout
end

get "/todos/new" do

end

post "/todos/new" do

end

# [
#   {name: "Corinthians", todos: ["Hugo", "Memphis", "Magno"]},
#   {name: "Liverpool", todos: ["Salah", "Diaz"]},
#   {name: "Reign FC", todos: ["Fishlock", "Huitema"]}
# ]