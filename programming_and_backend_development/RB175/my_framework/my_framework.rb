# Manages html file production from ruby code in my_app.rb

class MyFramework
  def response(status, headers, body = '')
    body = yield if block_given?
    [status, headers, [body]]
  end

  def erb(filename, local = {})
    b = binding
    message = local[:message]
    content = File.read("views/#{filename}.erb")
    ERB.new(content).result(b)
  end
end
