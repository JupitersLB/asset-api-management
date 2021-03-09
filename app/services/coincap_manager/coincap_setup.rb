module CoincapManager
  class CoincapSetup < ApplicationService
    def initialize(client = 'bifinex', asset = Asset.find_by(external_id: 'BTCUSD'))
      @asset =  asset
      @client = client
    end

    def call
      # response = case @request
      #            when 'balance'
      #              balance
      #            when 'add order'
      #              add_order
      #            when 'cancel order'
      #              cancel_order
      #            when 'deposit methods'
      #              deposit_methods
      #            when 'trade volume'
      #              trade_volume
      #            end
      # response['result'] ? response['result'] : response['error']
    end

    def find_client
      # @client = case @client
      #           when 'bitfinex'
      #             new ccxws.Bitfinex()
    end
  end
end
