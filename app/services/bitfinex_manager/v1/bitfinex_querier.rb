module BitfinexManager::V1
  class BitfinexQuerier < ApplicationService

    def initialize(command)
      @command = command
    end

    def call
      client = Bitfinex::RESTv1.new({
        :api_key => ENV['BITFINEX_API_KEY'],
        :api_secret => ENV['BITFINEX_API_SECRET']
      })
      client.send(*clean_command)
      # client.send(:candles, *['tBTCUSD', '4h', 'hist'])
    end

    def clean_command
      array = []
      split_command = @command.split('(')
      if split_command.size > 1
        array.push(split_command[0].to_sym, split_command[1].sub(')', '').gsub!("'", ''))
        array
      else
        @command
      end
    end
  end
end
