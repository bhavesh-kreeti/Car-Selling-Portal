class BrandsController < ApplicationController
  before_action :set_brand, only: [:edit, :update, :destroy]
  before_action :require_login 
  before_action :require_admin
  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end


  def edit
  end

  def create
    @brand = Brand.new(brand_params)

      if @brand.save
        redirect_to brands_path, notice: 'Brand was successfully created.'
      else
        render :new
      end
  end

  def update
      if @brand.update(brand_params)
        redirect_to brands_path, notice: 'Brand was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @brand.destroy
      redirect_to brands_url, notice: 'Brand was successfully destroyed.' 
  end


  private
    def set_brand
      @brand = Brand.find(params[:id])
    end

    def brand_params
      params.require(:brand).permit(:name)
    end
end