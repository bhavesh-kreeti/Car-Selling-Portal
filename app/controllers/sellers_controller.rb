class SellersController < ApplicationController
  include SellersHelper
  before_action :require_login 
  before_action :require_admin ,only: [:approve, :reject]
  before_action :require_buyer, except: [:create,:new]
  before_action :require_seller, only: [:create,:new]

  def index
  if params[:search].present?
  @sellers =   search(params[:search])
  else
  @sellers = Seller.all
  end
  end 

  def new
  @seller = Seller.new
  end

  def search_model
  @sellers = Seller.car_model( params[:model_id])
  end

  def search_city
  @sellers = Seller.car_city( params[:city_id])
  end

  def search_brand
  @sellers = Seller.car_brand( params[:brand_id])
  end

  def search_registration_year
  @sellers = Seller.car_reg_year( params[:registration_year_id])
  end
  
  def search_kilometer_driven
  @sellers = Seller.car_kilometer_driven( params[:kilometer_driven_id])
  end

  def search_variant
  @sellers = Seller.car_variant( params[:variant_id])
  end

  def search_registration_state
  @sellers = Seller.car_reg_state( params[:registration_state_id])
  end
  
  def create
	@seller = Seller.new(seller_params)
	@seller.user_id = current_user.id
    if @seller.save
    redirect_to new_token_path, notice: 'Add was sucessfully posted.' 
    else
    render :new
    end
  end

  def approve
    @seller = Seller.find(params[:id])
    @seller.purchase_status="Sold"
    @seller.save
    user=User.find(@seller.buyer_id).email
    #Seller.approve_status(user)
    @approve= @seller.tokens
    @approve.each do |p|
      p.status = "SOLD"
      p.save
    end
    redirect_to update_status_tokens_path
  end


  def reject
    @seller = Seller.find(params[:id])
    @seller.purchase_status="purchase"
    @seller.save
    user=User.find(@seller.buyer_id).email
    #Seller.reject_status(user)
    redirect_to update_status_tokens_path
  end

def toggle_status
    @seller = Seller.find(params[:id])
  if @seller.purchase_status == "purchase" 
    @seller.purchase_status = "cancel purchase"
    @seller.buyer_id = current_user.id
    @seller.save
  elsif @seller.purchase_status == "cancel purchase" 
    @seller.purchase_status = "purchase"
      @seller.buyer_id = current_user.id

    @seller.save
  end
  redirect_to sellers_path 
end


  private

  def seller_params
  params.require(:seller).permit(:city_id, :brand_id, :model_id, :registration_year_id, :registration_state_id, :variant_id, :kilometer_driven_id,:token_id, :user_id, :buyer_id)
  end
end