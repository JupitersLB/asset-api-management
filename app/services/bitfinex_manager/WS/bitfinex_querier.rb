module BitfinexManager::WS
  class BitfinexQuerier < ApplicationService

    def initialize; end

    def call
      client = Bitfinex::WSv2.new({
        :api_key => ENV['BITFINEX_API_KEY'],
        :api_secret => ENV['BITFINEX_API_SECRET'],
        :transform => true, # provide models as event data instead of arrays
      })
      client.on(:open) do
        client.auth!
        client.subscribe_ticker('tBTCUSD')
      end
      client.open!
    end
  end
end
