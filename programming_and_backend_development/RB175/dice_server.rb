require "socket"

server = TCPServer.new("localhost", 3030)

def parse_request(request_line)
  method, path_and_params, scheme = request_line.split
  path, params = path_and_params.split("?")
  params_hash = params.split("&").each_with_object({}) do |nv, hash|
    name, value = nv.split("=")
    hash[name] = value
  end
  [method, path, params_hash, scheme]
end

loop do
  client = server.accept
  
  request_line = client.gets
  puts request_line
  next if !request_line || request_line =~ /favicon/
  
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"

  method, path, params_hash, scheme = parse_request(request_line)
  dice = params_hash["dice"].to_i
  sides = params_hash["sides"].to_i

  client.puts "<html>", "<body>", "<p>"
  client.puts "The #{dice} rolls are:\r\n"
  client.puts "<ul>"
  dice.times do
    client.puts "<li>#{rand(sides) + 1}</li>"
  end
  client.puts "</ul>"
  client.puts "</body>", "</html>"
  client.close
end
