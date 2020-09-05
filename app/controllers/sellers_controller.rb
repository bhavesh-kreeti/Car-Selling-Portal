class SellersController < ApplicationController
  before_action :require_login 
  before_action :require_admin ,only: [:approve, :reject],except: [:approve, :reject,:update_status,:my_add]
  before_action :require_buyer, except: [:create,:new,:approve, :reject,:update_status,:my_add]
  before_action :require_seller, only: [:create,:new,:approve, :reject,:update_status,:my_add]
   include ApplicationHelper

  def index
    if params[:search].present?
      query = params[:search]
      @sellers =   Seller.search(query)
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
    @sellers = Seller.all
    @sellers = @sellers.car_city( params[:city_name]) if params[:city_name].present?
    @sellers = @sellers.car_model( params[:model_name]) if params[:model_name].present?
    @sellers = @sellers.car_brand( params[:brand_name]) if params[:brand_name].present?
    @sellers = @sellers.car_reg_year( params[:registration_year_name]) if params[:registration_year_name].present?
    @sellers = @sellers.car_kilometer_driven( params[:kilometer_driven_name]) if params[:kilometer_driven_name].present?
    @sellers = @sellers.car_variant( params[:variant_name]) if params[:variant_name].present?
    @sellers = @sellers.car_reg_state( params[:registration_state_name]) if params[:registration_state_name].present?
    @sellers
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
      redirect_to new_token_path, notice: 'Generate appointment.' 
    else
    render :new
    end
  end

  def approve
    @seller = Seller.find(params[:id])
    @seller.purchase_status="Sold"
    @seller.save
    ApprovePurchaseWorker.perform_async(@seller.id)
    @approve= @seller.tokens
    @approve.each do |p|
      p.status = "SOLD"
      p.save
    end
    redirect_to update_status_sellers_path
  end

  def reject
    @seller = Seller.find(params[:id]) 
    @seller.purchase_status="purchase"
    @seller.save
    RejectPurchaseWorker.perform_async(@seller.id)
    redirect_to update_status_sellers_path
  end

def toggle_status
    @seller = Seller.find(params[:id])
  if @seller.purchase_status == "purchase" 
    @seller.purchase_status = "cancel purchase"
    @seller.buyer_id = current_user.id
    @seller.save
    PurchaseNotifyWorker.perform_async(@seller.id)
  elsif @seller.purchase_status == "cancel purchase" 
    @seller.purchase_status = "purchase"
    @seller.buyer_id = current_user.id
    RejectNotifyWorker.perform_async(@seller.id)
    @seller.save
  end
  redirect_to sellers_path 
end

def update_status
  @updates = Seller.all.where(purchase_status:"cancel purchase", user_id: current_user.id)
end

def my_add
  @post = Seller.all.includes(:tokens).where(user_id: current_user.id)
end

private

  def seller_params
    params.require(:seller).permit(:city_id, :brand_id, :model_id, :registration_year_id, :registration_state_id, :variant_id, :kilometer_driven_id,:token_id, :user_id, :buyer_id)
  end
end
