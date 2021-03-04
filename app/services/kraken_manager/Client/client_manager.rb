module KrakenManager::Client
  class ClientManager < ApplicationService
    def initialize(request = nil, query = nil)
      @request = request
      @query =  query
      @client = $kraken_client
    end

    def call
      response = case @request
                 when 'balance'
                   balance
                 when 'add order'
                   add_order
                 when 'cancel order'
                   cancel_order
                 when 'deposit methods'
                   deposit_methods
                 when 'trade volume'
                   trade_volume
                 end
      response['result'] ? response['result'] : response['error']
    end

    def balance
      @client.balance
    end

    def add_order
      @client.add_order(@query)
    end

    def deposit_methods
      @client.deposit_methods(asset: @query)
    end

    def trade_volume
      @client.trade_volume
    end

    def cancel_order
      @client.cancel_order(@query)
    end
  end
end
