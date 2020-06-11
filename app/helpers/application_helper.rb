module ApplicationHelper
  def my_post
    post = Seller.all.where(user_id: current_user.id)
    post
  end
end
