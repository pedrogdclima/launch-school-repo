require 'sinatra'
require 'sinatra/reloader'

root = File.expand_path("..", __FILE__)

get "/" do
  @files = Dir.children(root + "/data")
  erb :home, layout: :layout
end

get "/:file_name" do
  @file_name = params[:file_name]
  @file_content = File.read("#{root}/data/#{@file_name}")
  
  headers["Content-Type"] = "text/plain"
  @file_content
  # erb :file, layout: :layout
end


=begin
LS's Solution

# cms.rb
require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

root = File.expand_path("..", __FILE__)

get "/" do
  @files = Dir.glob(root + "/data/*").map do |path|
    File.basename(path)
  end
  erb :index
end

=end