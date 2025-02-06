ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'rack/test'

require_relative '../cms'

class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  # def setup
  #   root = File.expand_path("..", __FILE__)
  #   @files = Dir.children(root + "/data")
  # end

  def test_home
    get "/"
    assert_equal 200, last_response.status
    refute_empty last_response.body
  end

  def test_file
    get "/about.txt"
    assert_equal "text/plain", last_response["Content-Type"]
    assert_equal "File named about.txt", last_response.body
  end
end