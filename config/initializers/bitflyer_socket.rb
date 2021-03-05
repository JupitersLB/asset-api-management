ws = WebSocket::Client::Simple.connect 'wss://ws.lightstream.bitflyer.com/json-rpc'
ws.on :message do |msg|
  ActionCable.server.broadcast(
    "BitflyerChannel",
    JSON.parse(msg.data)
  )
end

msg = JSON.generate({
    method: :subscribe,
    params: {
      channel: 'lightning_ticker_BTC_JPY',
    }
  })

ws.on :open do
  ws.send msg
end
