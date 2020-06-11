class AdminController < ApplicationController
  before_action :require_login 
  before_action :require_admin
    
  def admin
  
  end

  def require_login
    if !session[:user_id]
      flash[:notice] = "YOU MUST LOGIN IN FIRST"
      redirect_to root_path
    end
  end


  def require_admin
    if logged_in? && current_user.role.roles != "ADMIN"
      flash[:notice] = "ONLY ADMIN CAN PERFORM THIS"
      redirect_to root_path
    end
  end

end
