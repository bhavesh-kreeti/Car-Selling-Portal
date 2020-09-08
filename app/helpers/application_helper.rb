module ApplicationHelper
  def my_post
    post = Seller.all.includes(:tokens).where(user_id: current_user.id)
    post
  end

  def purchase
  	purchase = Seller.all.where(purchase_status: "cancel purchase", user_id: current_user.id)
  	purchase
  end 
end
