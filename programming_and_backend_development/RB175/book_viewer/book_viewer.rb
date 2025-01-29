require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"

get "/" do
  @list_of_titles = File.readlines("data/toc.txt")
  @title = "Working Title"
  erb :home
end

get "/chapter/1" do
  @list_of_titles = File.readlines("data/toc.txt")
  @title = "Chapter 1"
  @chapter_text = File.read("data/chp1.txt")
  erb :chapter
end
