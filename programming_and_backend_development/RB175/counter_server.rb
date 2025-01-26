require "socket"

server = TCPServer.new("localhost", 3030)

def parse_request(request_line)
  method, path_and_params, scheme = request_line.split
  path, params = path_and_params.split("?")
  params_hash = (params || "").split("&").each_with_object({}) do |nv, hash|
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
  counter = params_hash["counter"].to_i

  client.puts "<html>", "<body>"
  client.puts "<h2>Counter</h2>"
  client.puts "<p>#{counter}</p>"
  client.puts "<p><a href='?counter=#{counter + 1}'>Plus one</a></p>"
  client.puts "<p><a href='?counter=#{counter - 1}'>Minus one</a></p>"
  client.puts "</body>", "</html>"
  client.close
end
