require 'msgpack/rpc'

cli = MessagePack::RPC::Client.new("127.0.0.1", 5001)

cli.timeout = 5

1.times {
  puts cli.call(:echo, 'Call From Ruby')
  cli.close
}
