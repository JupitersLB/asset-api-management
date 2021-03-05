# $kraken_client = Kraken::Client.new(api_key: ENV['KRAKEN_API_KEY'], api_secret: ENV['KRAKEN_API_SECRET'])
# ws = WebSocket::Client::Simple.connect 'wss://ws.kraken.com'
Thread.new {

  EM.run {
    ws = Faye::WebSocket::Client.new('wss://ws.kraken.com')

    msg = {
      "event": "subscribe",
      "pair": [
        "XBT/USD"
      ],
      "subscription": {
        "name": "ticker"
      }
    }

    ws.on :open do |event|
      ws.send msg.to_json
    end

    ws.on :message do |event|
      ActionCable.server.broadcast(
        "KrakenChannel",
        JSON.parse(event.data)
      )
    end

    ws.on :close do |event|
      ws = nil
    end
  }
}

# p ws

# ws.on :message do |msg|
#   p msg
#   ActionCable.server.broadcast(
#     "KrakenChannel",
#     JSON.parse(msg)
#   )
# end

msg = {
  event: "ping",
  # "event": "subscribe",
  # "pair": [
  #   "XBT/USD"
  # ],
  # "subscription": {
  #   "name": "ticker"
  # }
}


# ws.on :open do
#   p'###########'
#   p ws
#   p msg.to_json
#   ws.send msg.to_json
# end

# ws.on :error do |e|
#   p e
# end
