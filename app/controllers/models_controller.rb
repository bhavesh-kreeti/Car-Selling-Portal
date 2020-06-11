class ModelsController < ApplicationController
  before_action :set_model, only: [ :edit, :update, :destroy]
  before_action :require_login 
  before_action :require_admin

  def index
    @models = Model.all
  end

  def new
    @model = Model.new
  end

  def edit
  end

  def create
    @model = Model.new(model_params)

      if @model.save
        redirect_to models_path, notice: 'Model was successfully created.' 
      else
        render :new
      end
    
  end

  def update
      if @model.update(model_params)
        redirect_to models_path, notice: 'Model was successfully updated.'
      else
        render :edit
      end
    
  end


  def destroy
    @model.destroy
      redirect_to models_url, notice: 'Model was successfully destroyed.'
  end


  private
    def set_model
      @model = Model.find(params[:id])
    end

    def model_params
      params.require(:model).permit(:name,:brand_id)
    end
end