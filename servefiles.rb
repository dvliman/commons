#!/usr/bin/env ruby

# simple http server on current directory

require 'webrick'
include WEBrick

dir = Dir::pwd
port = (ARGV.first || (12000 + (dir.hash % 1000))).to_i

url = "http://#{Socket.gethostname}:#{port}" 

puts "Opening #{url}"
`open #{url}`

s = HTTPServer.new(
  :Port            => port,
  :DocumentRoot    => dir
)

trap("INT"){ s.shutdown }
s.start
