class CitiesController < ApplicationController
  before_action :set_city, only: [ :edit, :update, :destroy]
  before_action :require_login 
  before_action :require_admin

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def edit
  end

  def create
    @city = City.new(city_params)
      if @city.save
        redirect_to cities_path notice: 'City was successfully created.' 
      else
        render :new 
      end
  end


  def update
      if @city.update(city_params)
         redirect_to cities_path, notice: 'City was successfully updated.' 
      else
        render :edit
      end
  end

  def destroy
    @city.destroy
      redirect_to cities_url, notice: 'City was successfully destroyed.'
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name)
    end
end