class DashboardsController < ApplicationController
  def index
    gon.key = ENV["BITFINEX_API_KEY"]
    gon.secret = ENV["BITFINEX_API_SECRET"]
    gon.url = ENV['BITFINEX_URL']
  end

  def wallet
    @wallets = BitfinexManager::V2::BitfinexQuerier.call
    # respond_to do |format|
    #   format.js
    # end
    raise
  end

  def query_v2
    @response = BitfinexManager::V2::BitfinexQuerier.call(v2_query_params)
    raise
  end

  def query_v1
    @response = BitfinexManager::V1::BitfinexQuerier.call(v1_query_params)
    raise
  end

  def websocket
    @response = BitfinexManager::WS::BitfinexQuerier.call
  end

  private

  def v2_query_params
    params.require(:bitfinex_V2_query).require(:query_v2)
  end

  def v1_query_params
    params.require(:bitfinex_V1_query).require(:query_v1)
  end
end
