require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"

get "/" do
  @files = Dir.glob("public/*").map {|file| File.basename(file) }.sort
  @files.reverse! if params[:sort]
  erb :home
end

get "/testpage" do
  File.read("public/testpage.html")
end
