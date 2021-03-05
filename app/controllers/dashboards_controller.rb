class DashboardsController < ApplicationController

  def index
  end

  def query_v2
    @response = BitfinexManager::V2::BitfinexQuerier.call(v2_query_params)
    raise
  end

  def query_v1
    @response = BitfinexManager::V1::BitfinexQuerier.call(v1_query_params)
    raise
  end

  def new_order
    BitfinexManager::WS::NewOrder.call(new_order_params)
  end

  def update_order
    BitfinexManager::WS::UpdateOrder.call(update_order_params)
  end

  def cancel_order
    BitfinexManager::WS::CancelOrder.call(cancel_order_params)
  end

  def cancel_all_orders
    BitfinexManager::WS::CancelAllOrders.call
  end

  def kraken_api_manager
    @response = KrakenManager::Client::ClientManager.call('trade volume')
    respond_to do |format|
      format.js
    end
  end

  private

  def new_order_params
    params.require(:new_order).require(:type, :symbol, :amount, :price)
  end

  def update_order_params
    params.require(:update_order).require(:id, :amount, :price)
  end

  def cancel_order_params
    params.require(:cancel_order).require(:id)
  end

  def v2_query_params
    params.require(:bitfinex_V2_query).require(:query_v2)
  end

  def v1_query_params
    params.require(:bitfinex_V1_query).require(:query_v1)
  end
end
