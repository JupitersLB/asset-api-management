class AccountChannel < ApplicationCable::Channel
  def subscribed
    stream_from "AccountChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
