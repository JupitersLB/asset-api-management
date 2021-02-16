module BitfinexManager::WS
  class NewOrder < ApplicationService

    def initialize(request)
      @request = request
    end

    def call
      BitfinexManager::WS::WebsocketManager.call(@request)
    end
  end
end
