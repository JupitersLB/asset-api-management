module BitfinexManager::WS
  class NewOrder < ApplicationService

    def initialize(request)
      @request = request
    end

    def call
      BitfinexManager::WS::WebsocketManager.call(input_payload)
    end

    private

    def input_details
      details = {
        cid: Time.now.to_i,
        type: @request[0],
        symbol: @request[1],
        amount: @request[2],
        price: @request[3]
      }
      details
    end

    def input_payload
      payload = [0, 'on', nil, input_details]
      payload
    end
  end
end
