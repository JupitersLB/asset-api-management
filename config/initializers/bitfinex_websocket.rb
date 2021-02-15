ws = WebSocket::Client::Simple.connect 'wss://api-pub.bitfinex.com/ws/2'
ws.on :message do |msg|
  ActionCable.server.broadcast(
    "BitfinexChannel",
    msg.data
  )
end
msg = {
    event: 'subscribe',
    channel: 'ticker',
    symbol: 'tBTCUSD'
  }
ws.on :open do
  ws.send msg.to_json
end

# ws.on :error do |e|
#   p e
# end

# loop do
#   ws.send STDIN.gets.strip
# end
