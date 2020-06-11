class VariantsController < ApplicationController
  before_action :set_variant, only: [ :edit, :update, :destroy]
  
  def index
    @variants = Variant.all
  end

  def new
    @variant = Variant.new
  end

  def edit
  end

  
  def create
    @variant = Variant.new(variant_params)
      if @variant.save
        redirect_to variants_path, notice: 'Variant was successfully created.'
      else
        render :new 
      end
  end

  
  def update
      if @variant.update(variant_params)
        redirect_to variants_path, notice: 'Variant was successfully updated.' 
      else
        render :edit 
      end
  end

  
  def destroy
    @variant.destroy
    redirect_to variants_url, notice: 'Variant was successfully destroyed.' 
  end

  private
    def set_variant
      @variant = Variant.find(params[:id])
    end

    def variant_params
      params.require(:variant).permit(:name)
    end
end