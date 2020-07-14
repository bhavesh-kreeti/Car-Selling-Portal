class TokensController < ApplicationController
  before_action :set_token, only: [ :edit, :update,:show ]
  before_action :require_login 
  before_action :require_seller, only: [:new,:create,:my_add,:index,:status_search,:update_status] 
  before_action :require_admin ,only: [:edit,:update]

  include ApplicationHelper
  def index
    @mylist = current_user.tokens
      @tokens = Token.all
  end

  def my_add
    @my_add = my_post
  end

  def new
    @token = Token.new
  end

  def show
     
  end

  def edit
  end

  def create
    @token = CarCost.first.tokens.build(token_params)
    @token.user_id = current_user.id
    @token.seller_id = current_user.sellers.last.id

    if @token.save
      redirect_to root_path, notice: 'Your post is waiting for approval from admin.'
    else
      render :new
    end
  end

  def update
    
    if @token.update(token_params)
      AdminMailer.admin_mail(@token.user.email,@token.status ).deliver
      redirect_to approve_status_path, notice: 'Status of post changed'
    else
      render :edit
    end
  end

  def status_search
    @search = Token.all.where(id: params[:q])
  end
  
  def update_status
    @update= Seller.all.where(purchase_status:"cancel purchase", user_id: current_user.id)
  end

  private
    def set_token
      @token = Token.find(params[:id])
    end

    def token_params
      params.require(:token).permit(:phoneno, :user_id,:status,:seller_id,:appointment_date,:car_cost_id)
    end
    
end