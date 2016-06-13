require 'webrick'

server = WEBrick::HTTPServer.new Port: ENV['PORT']

server.mount_proc "/.well-known/acme-challenge/#{ENV['LETSENCRYPT_TOKEN_FILENAME']}" do |req, res|
  res.body = ENV['LETSENCRYPT_TOKEN_VALUE']
end

trap 'INT' do server.shutdown end
server.start
