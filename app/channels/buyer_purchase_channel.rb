class BuyerPurchaseChannel < ApplicationCable::Channel
  def subscribed
     stream_from "buyer_purchase_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
