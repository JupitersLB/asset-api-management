module BitfinexManager::WS
  class WebsocketManager < ApplicationService

    def initialize(request = nil)
      @request = request
    end

    def call
      connect_websocket
    end

    private

    def authenticate_websocket
      auth_nonce = Time.now.to_i * 1000
      auth_payload = "AUTH#{auth_nonce}"
      hmac = OpenSSL::HMAC.new(ENV["BITFINEX_API_SECRET"], OpenSSL::Digest::SHA384.new)
      hmac << auth_payload
      auth_sig = hmac.hexdigest
      payload = {
        apiKey: ENV["BITFINEX_API_KEY"],
        authSig: auth_sig,
        authNonce: auth_nonce,
        authPayload: auth_payload,
        event: 'auth',
        filter: %w(trading wallet balance notify)
      }
      payload
    end

    def connect_websocket
      ws = WebSocket::Client::Simple.connect 'wss://api.bitfinex.com/ws/2'
      payload = authenticate_websocket
      ws.on :open do
        ws.send payload.to_json
      end
      ws.on :message do |msg|
        websocket_with_request(msg, ws) unless @request.nil?
        ActionCable.server.broadcast(
          "AccountChannel",
          msg.data
        )
      end
    end

    def websocket_with_request(msg, ws)
      response = JSON.parse(msg)
      ws.send @request.to_json if response[1] == 'ws'
    end
  end
end
