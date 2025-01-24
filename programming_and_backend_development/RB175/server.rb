require "socket"

server = TCPServer.new("localhost", 3030)

loop do
  client = server.accept
  
  request_line = client.gets
  puts request_line
  next if !request_line || request_line =~ /favicon/
  
  client.puts request_line
  clinet.close
end
