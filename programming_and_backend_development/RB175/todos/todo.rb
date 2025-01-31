require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"

before do
  @lists = 
    [
      {name: "Corinthians", todos: ["Hugo", "Memphis", "Magno"]},
      {name: "Liverpool", todos: ["Salah", "Diaz"]},
      {name: "Reign FC", todos: ["Fishlock", "Huitema"]}
    ]
end

get "/" do
  redirect "/lists"
end

get "/lists" do
  erb :lists, layout: :layout
end
