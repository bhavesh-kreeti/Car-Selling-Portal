class RejectNotifyWorker
  include Sidekiq::Worker

  def perform(id)
    seller = Seller.find(id)
    ActionCable.server.broadcast "buyer_cancel_purchase_channel", buyer_id: seller.id
  end
end
