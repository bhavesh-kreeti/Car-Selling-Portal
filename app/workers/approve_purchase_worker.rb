class ApprovePurchaseWorker
  include Sidekiq::Worker

  def perform(id)
    seller = Seller.find(id)
    buyer_user=User.find(seller.buyer_id)
    seller_user = seller.user

    SellerMailer.car_sold(seller_user).deliver
    BuyerMailer.approve(buyer_user).deliver
  end
end
