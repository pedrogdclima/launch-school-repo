require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"

before do

  @list_of_titles = File.readlines("data/toc.txt")

end

not_found do

  redirect "/"

end

get "/" do

  @title = "The Adventures of Sherlock Holmes"
  erb :home

end

get "/chapter/:num" do

  number = params[:num].to_i
  chapter_name = @list_of_titles[number - 1]

  redirect "/" unless (1..@list_of_titles.size).cover? number

  @title = "Chapter #{number}: #{chapter_name}"
  @chapter_text = File.read("data/chp#{number}.txt")
  erb :chapter

end

def each_chapter
  @list_of_titles.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end

def chapters_matching(query)
  results = []

  return results unless query

  each_chapter do |number, name, contents|
    matches = {}
    contents.split("\n\n").each_with_index do |paragraph, index|
      matches[index] = paragraph if paragraph.include?(query)
    end
    results << {number: number, name: name, paragraphs: matches} if matches.any?
  end

  results
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").each_with_index.map do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end.join
  end

  def highlight(text, term)
    text.gsub(term, %(<strong>#{term}</strong>))
  end
end