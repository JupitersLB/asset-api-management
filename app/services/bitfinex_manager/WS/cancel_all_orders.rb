module BitfinexManager::WS
  class CancelAllOrders < ApplicationService

    def initialize; end

    def call
      BitfinexManager::WS::WebsocketManager.call(input_payload)
    end

    private

    def input_details
      details = {
        all: 1
      }
      details
    end

    def input_payload
      payload = [0, 'oc_multi', nil, input_details]
      payload
    end
  end
end
