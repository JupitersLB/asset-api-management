class BitfinexChannel < ApplicationCable::Channel
  def subscribed
    stream_from "BitfinexChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
