require 'sinatra'
require 'sinatra/reloader'

root = File.expand_path("..", __FILE__)

configure do
  enable :sessions
  # set :erb, :escape_html => true
  set :session_secret, SecureRandom.hex(32)
end

def valid_url?(file_name)
  File.file?("data/#{file_name}")
end

# before do
#   session[:message] ||= []
# end

get "/" do
  @files = Dir.children(root + "/data")
  erb :home, layout: :layout
end

get "/:file_name" do
  @file_name = params[:file_name]
  if valid_url?(@file_name)
    @file_content = File.read("#{root}/data/#{@file_name}")
    headers["Content-Type"] = "text/plain"
    @file_content
  else
    session[:message] = "No record of file named '#{@file_name}'"
    redirect "/"
  end
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