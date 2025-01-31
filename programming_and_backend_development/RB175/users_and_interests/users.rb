require 'sinatra'
require 'yaml'
require_relative 'users'

# 1. When a user loads the home page, they should be redirected to a page that lists all of the users' names. Load the users from the users.yaml file (content below).
# 2. Each of the users' names should be a link to a page for that user.
# 3. On each user's page, display their email address. Also display their interests, with a comma appearing between each interest.
# 4. At the bottom of each user's page, list links to all of the other users pages. Do not include the user whose page it is in this list.
# 5. Add a layout to the application. At the bottom of every page, display a message like this: "There are 3 users with a total of 9 interests."
# 6. Update the message printed out in #5 to determine the number of users and interests based on the content of the YAML file. Use a view helper method, count_interests, to determine the total number of interests across all users.
# 7. Add a new user to the users.yaml file. Verify that the site updates accordingly.

before do
  @all_data = YAML.load_file("users.yaml")
  @names_list = @all_data.keys.map(&:to_s)
end

get "/" do
  erb :home
end

get "/user/:name" do
  @user_name = params[:name].capitalize
  @user_data = @all_data[@user_name.downcase.to_sym]
  erb :user
end

helpers do
  def count_interests()
    @all_data.each_with_object([]) do |(user_k, user_v), interests_list|
      interests_list << user_v[:interests]
    end.flatten.uniq.size
  end

  def count_users()
    @names_list.size
  end
end
