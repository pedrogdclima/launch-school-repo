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

  def test_invalid_file_name
    bad_file_name = "invalid_file_name.txt"
    get "/#{bad_file_name}"
    assert_equal 302, last_response.status

    get last_response["Location"]
    assert_includes last_response.body, bad_file_name

    get "/"
    refute_includes last_response.body, bad_file_name
  end
end