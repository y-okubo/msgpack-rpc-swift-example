require 'msgpack/rpc'

class MyHandler
  def echo(msg)
    puts msg
    return "Echo: #{msg}"
  end
end

svr = MessagePack::RPC::Server.new
svr.listen('127.0.0.1', 5000, MyHandler.new)

Signal.trap(:TERM) { svr.stop }
Signal.trap(:INT)  { svr.stop }

puts 'Start msgpack rpc server'

svr.run
