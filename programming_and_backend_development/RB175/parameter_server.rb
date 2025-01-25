require "socket"

server = TCPServer.new("localhost", 3030)

loop do
  client = server.accept
  
  request_line = client.gets
  puts request_line
  next if !request_line || request_line =~ /favicon/
  
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"

  client.puts "You sent:"
  client.puts request_line

  method, path_and_params, scheme = request_line.split
  path, params = path_and_params.split("?")
  params_hash = params.split("&").each_with_object({}) do |n_v, hash|
    name, value = n_v.split("=")
    hash[name] = value
  end

  client.puts "\r\nHTTP request line components:",
              "Method => " + method,
              "Path => " + path,
              "Parameters => " + params,
              "Scheme => " + scheme,
              "\r\nParameters Hash => " + params_hash.to_s

  client.close
end
