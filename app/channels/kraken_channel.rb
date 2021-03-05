class KrakenChannel < ApplicationCable::Channel
  def subscribed
    stream_from "KrakenChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
