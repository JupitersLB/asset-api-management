module BitfinexManager::WS
  class CancelOrder < ApplicationService

    def initialize(request)
      @request = request
    end

    def call
      BitfinexManager::WS::WebsocketManager.call(input_payload)
    end

    private

    def input_details
      details = {
        id: @request
      }
      details
    end

    def input_payload
      payload = [0, 'oc', nil, input_details]
      payload
    end
  end
end
