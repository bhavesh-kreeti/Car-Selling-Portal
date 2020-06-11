class TokensController < ApplicationController
  before_action :set_token, only: [ :edit, :update,:show ]
  before_action :require_login 
  before_action :require_seller

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
    @token = Token.new(token_params)
    @token.user_id = current_user.id
    @token.seller_id = current_user.sellers.last.id

    if @token.save
      redirect_to @token, notice: 'Token was successfully created.'
    else
      render :new
    end
  end

  def update
    if @token.update(token_params)
      redirect_to tokens_path, notice: 'Token was successfully updated.'
    else
      render :edit
    end
  end

  def status_search
    @search = Token.all.where(id: params[:q])
  end
  
  def update_status
    @update= Seller.all.where(purchase_status:"cancel purchase")
  end

  private
    def set_token
      @token = Token.find(params[:id])
    end

    def token_params
      params.require(:token).permit(:phoneno, :user_id,:status,:seller_id)
    end
    
end