
require_relative 'advice'

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      [200, {'content-type' => 'text/html'}, ["<html><h2>Hello <em>World</em></h2></html>"]]
    when '/advice'
      advice = Advice.new.generate
      [200, {'content-type' => 'text/html'}, ["<html><b>#{advice}</b></html>"]]
    else
      [404, {'content-type' => 'text/html', "content-length" => '31'}, ["<html><h4>Not Found</h4></html>"]]
    end
  end
end
