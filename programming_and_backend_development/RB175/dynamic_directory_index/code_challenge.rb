require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"

# set :port, 5678

get "/" do
  # @files = Dir.glob("public/*").map do |file|
  #   "File: #{File.basename(file)}"
  # end.sort
  @files = Dir.glob("public/*").map {|file| File.basename(file) }.sort
  @files.reverse! if params[:sort]
  erb :home
end

get "/testpage" do
  File.read("public/testpage.html")
end

# # list.rb
# require "sinatra"
# require "sinatra/reloader"
# require "tilt/erubis"

# get "/" do
#   @files = Dir.glob("public/*").map {|file| File.basename(file) }.sort
#   @files.reverse! if params[:sort] == "desc"
#   erb :list
# end
