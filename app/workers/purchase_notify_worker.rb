class PurchaseNotifyWorker
  include Sidekiq::Worker

  def perform(id)
    seller = Seller.find(id)
    ActionCable.server.broadcast "buyer_purchase_channel", purchase: ApplicationController.render(partial: 'sellers/update', locals: { seller: seller }), buyer_id: seller.id, user_id: seller.user.id
  end
end


