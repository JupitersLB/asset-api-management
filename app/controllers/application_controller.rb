class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :authenticate_websocket

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

    ws = WebSocket::Client::Simple.connect 'wss://api.bitfinex.com/ws/2'
    ws.on :open do
      ws.send payload.to_json
    end
    ws.on :message do |msg|
      ActionCable.server.broadcast(
        "AccountChannel",
        msg.data
      )
    end
  end
end
