module BitfinexManager::WS
  class UpdateOrder < ApplicationService

    def initialize(request)
      @request = request
    end

    def call
      BitfinexManager::WS::WebsocketManager.call(input_payload)
    end

    private

    def input_details
      details = {
        id: @request[0],
        amount: @request[1],
        price: @request[2]
      }
      details
    end

    def input_payload
      payload = [0, 'ou', nil, input_details]
      payload
    end
  end
end
