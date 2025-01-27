# Basic ruby webapp to learn about rack, erb, and web frameworks
# Built from Launch School's Growing Your Own Web Framework with Rack
# https://launchschool.medium.com/growing-your-own-web-framework-with-rack-part-1-8c4c630c5faf

require_relative 'my_framework'
require_relative 'advice'

class MyApp < MyFramework
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      status = 200
      headers = {
        'content-type' => 'text/html'
      }
      response(status, headers) do
        erb('index')
      end
    when '/advice'
      piece_of_advice = Advice.new.generate
      status = 200
      headers = {
        'content-type' => 'text/html'
      }
      response(status, headers) do
        erb('advice', { message: piece_of_advice })
      end
    else
      status = 404
      headers = {
        'content-type' => 'text/html',
        'content-length' => '74'
      }
      response(status, headers) do
        erb('not_found')
      end
    end
  end
end
