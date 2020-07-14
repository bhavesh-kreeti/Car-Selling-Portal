module ApplicationHelper
  def my_post
    post = Seller.all.includes(:tokens).where(user_id: current_user.id)
    post
  end
end


