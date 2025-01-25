require "socket"

server = TCPServer.new("localhost", 3030)

loop do
  client = server.accept
  
  request_line = client.gets
  puts request_line
  next if !request_line || request_line =~ /favicon/
  
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/plain\r\n\r\n"

  client.puts request_line

  client.close
end
