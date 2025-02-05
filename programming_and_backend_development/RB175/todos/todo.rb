require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubi"
require "pry"

configure do
  enable :sessions
  set :session_secret, "f650ed69344bab0084199bb8cc9aa5a1bd6756c3b57ad67023255af0fc379ordep"
  # set :session_secret, SecureRandom.hex(32)
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

# Display specifc list
get "/lists/:index" do
  @index = params[:index].to_i
  @list = session[:lists][@index]
  erb :todos, layout: :layout
end

# Display change list name
get "/lists/:index/edit" do
  @index = params[:index].to_i
  @list = session[:lists][@index]
  erb :edit_list, layout: :layout
end

# Change list name
post "/lists/:index" do
  list_name = params[:list_name].strip
  @index = params[:index].to_i
  @list = session[:lists][@index]
  error = add_error_message_if_name_invalid(list_name)

  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    session[:lists][@index][:name] = list_name
    session[:success] = "List name updated"
    redirect "/lists/#{@index}"
  end
end

# Delete a list
post "/lists/:index/delete" do
  session[:lists].delete_at(params[:index].to_i)
  session[:success] = "List deleted"
  redirect "/lists"
end

# Add a new todo to a list
post "/lists/:index/todos" do
  @index = params[:index].to_i
  @list = session[:lists][@index]
  todo_name = params[:todo].strip

  error = add_error_message_if_name_invalid(todo_name)

  if error
    session[:error] = error
    erb :todos, layout: :layout
  else
    session[:lists][@index][:todos] << { name: todo_name, completed: false }
    session[:success] = "New todo created"
    redirect "/lists/#{@index}"
  end
end

# Delete specific todo
post "/lists/:list_idx/todos/:todo_idx/delete" do
  list_idx = params[:list_idx].to_i
  todo_idx = params[:todo_idx].to_i
  session[:lists][list_idx][:todos].delete_at(todo_idx)
  session[:success] = "Todo deleted"
  redirect "/lists/#{list_idx}"
end

# Change completed checkmark for a todo in a list
post "/lists/:list_idx/todos/:todo_idx/state" do
  new_state = !(params[:state] == "true")
  list_idx = params[:list_idx].to_i
  todo_idx = params[:todo_idx].to_i
  session[:lists][list_idx][:todos][todo_idx][:completed] = new_state
  redirect "/lists/#{list_idx}"
end

# Set all todos in a list to complete
post "/lists/:index/complete" do
  list_idx = params[:index].to_i
  session[:lists][list_idx][:todos].each do |todo|
    todo[:completed] = true
  end
  redirect "/lists/#{list_idx}"
end

def add_error_message_if_name_invalid(name)
  if !(1..80).cover?(name.size)
    "Invalid input. Name must be between 1 and 80 characters long."
  elsif session[:lists].any? { |list| list[:name] == name }
    "Invalid input. Name must be unique."
  end
end

helpers do
  def list_complete?(list)
    !list[:todos].empty? && !list[:todos].any?{ |todo| !todo[:completed] }
  end

  def fraction_completed(list)
    total = list[:todos].size
    completed = list[:todos].count{ |todo| todo[:completed]}
    "#{completed}/#{total}"
  end

  def sort_collection(collection, type, &block)
    complete, incomplete = collection.partition do |ele|
      if type == 'lists'
        list_complete?(ele)
      elsif type == 'todos'
        ele[:completed]
      end
    end
    
    incomplete.each { |ele| yield(ele, collection.index(ele)) }
    complete.each { |ele| yield(ele, collection.index(ele)) }
  end

  # def sort_lists(lists, &block)
  #   complete, incomplete = lists.partition { |list| list_complete?(list) }
    
  #   incomplete.each { |list| yield(list, lists.index(list)) }
  #   complete.each { |list| yield(list, lists.index(list)) }
  # end

  # def sort_todos(todos, &block)
  #   complete, incomplete = todos.partition { |todo| todo[:completed] }
    
  #   incomplete.each { |todo| yield(todo, todos.index(todo)) }
  #   complete.each { |todo| yield(todo, todos.index(todo)) }
  # end
end

# [
#   {name: "Corinthians", todos: [
#                             {name: "Hugo", completed: false},
#                             {name: "Memphis", completed: false}
#                                 ]}
# ]