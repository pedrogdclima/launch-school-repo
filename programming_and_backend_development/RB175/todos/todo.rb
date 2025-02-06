require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubi"
require "pry"

configure do
  enable :sessions
  set :erb, :escape_html => true
  set :session_secret, SecureRandom.hex(32)
end

def load_list(id)
  list = session[:lists].find{ |list| list[:id] == id }
  return list if list

  session[:error] = "The specified list was not found."
  redirect "/lists"
end

def add_error_message_if_name_invalid(name)
  if !(1..80).cover?(name.size)
    "Invalid input. Name must be between 1 and 80 characters long."
  elsif session[:lists].any? { |list| list[:name] == name }
    "Invalid input. Name must be unique."
  end
end

def new_id(collection)
  id = collection.max_by { |ele| ele[:id] }&.[](:id) || 0
  id + 1
end

helpers do
  def list_complete?(list)
    !list[:todos].empty? && !list[:todos].any?{ |todo| !todo[:completed] }
  end

  def list_class(list)
    "complete" if list_complete?(list)
  end

  def fraction_completed(list)
    total = list[:todos].size
    completed = list[:todos].count{ |todo| todo[:completed]}
    "#{completed}/#{total}"
  end

  def sort_collection(collection, &block)
    complete, incomplete = collection.partition do |ele|
      if !!ele[:todos]
        list_complete?(ele)
      else
        ele[:completed]
      end
    end
    
    incomplete.each(&block)
    complete.each(&block)
  end
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
    session[:lists] << {
      id: new_id(session[:lists]),
      name: list_name,
      todos: []
    }
    session[:success] = "New list created"
    redirect "/lists"
  end
end

# Display specifc list
get "/lists/:id" do
  @list_id = params[:id].to_i
  @list = load_list(@list_id)
  erb :todos, layout: :layout
end

# Display change list name
get "/lists/:id/edit" do
  @list_id = params[:id].to_i
  @list = load_list(@list_id)
  erb :edit_list, layout: :layout
end

# Change list name
post "/lists/:id" do
  list_name = params[:list_name].strip
  @list_id = params[:id].to_i
  @list = load_list(@list_id)
  error = add_error_message_if_name_invalid(list_name)

  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    session[:lists][@list_id][:name] = list_name
    session[:success] = "List name updated"
    redirect "/lists/#{@list_id}"
  end
end


# Delete a list
post "/lists/:id/delete" do
  list_id = params[:id].to_i
  session[:lists].reject! { |list| list[:id] == list_id}
  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/lists"
  else
    session[:success] = "List deleted"
    redirect "/lists"
  end
end

# Add a new todo to a list
post "/lists/:id/todos" do
  @list_id = params[:id].to_i
  @list = load_list(@list_id)
  todo_name = params[:todo].strip

  error = add_error_message_if_name_invalid(todo_name)

  if error
    session[:error] = error
    erb :todos, layout: :layout
  else
    @list[:todos] << {
      id: new_id(@list[:todos]),
      name: todo_name,
      completed: false
    }
    session[:success] = "New todo created"
    redirect "/lists/#{@list_id}"
  end
end

# Delete specific todo
post "/lists/:list_id/todos/:todo_id/delete" do
  list_id = params[:list_id].to_i
  todo_id = params[:todo_id].to_i
  list = session[:lists].find { |list| list[:id] == list_id}
  list[:todos].reject! { |todo| todo[:id] == todo_id}

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    status 204
  else
    session[:success] = "Todo deleted"
    redirect "/lists/#{list_id}"
  end
end

# Change completed checkmark for a todo in a list
post "/lists/:list_id/todos/:todo_id/state" do
  new_state = !(params[:state] == "true")
  list_id = params[:list_id].to_i
  todo_id = params[:todo_id].to_i
  list = session[:lists].find { |list| list[:id] == list_id}
  todo = list[:todos].find { |todo| todo[:id] == todo_id }
  todo[:completed] = new_state

  redirect "/lists/#{list_id}"
end

# Set all todos in a list to complete
post "/lists/:id/complete" do
  list_id = params[:id].to_i
  list = session[:lists].find { |list| list[:id] == list_id}
  list[:todos].each do |todo|
    todo[:completed] = true
  end
  redirect "/lists/#{list_id}"
end
