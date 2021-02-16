class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :connect_websocket, only: :index

  private

  def connect_websocket
    BitfinexManager::WS::WebsocketManager.call
  end
end
