class RejectPurchaseWorker
  include Sidekiq::Worker

  def perform(id)
    seller = Seller.find(id)
    user = User.find(seller.buyer_id)
    
    BuyerMailer.reject(user).deliver
  end
end
