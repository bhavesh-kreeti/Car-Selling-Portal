class KilometerDrivensController < ApplicationController
  before_action :set_kilometer_driven, only: [ :edit, :update, :destroy]
  before_action :require_login 
  before_action :require_admin

  def index
    @kilometerdrivens = KilometerDriven.all
  end

  def new
    @kilometerdriven = KilometerDriven.new
  end

  def edit
  end

  def create
    @kilometerdriven = KilometerDriven.new(kilometer_driven_params)

    if @kilometerdriven.save
      redirect_to kilometer_drivens_path, notice: 'Kilometerdriven was successfully created.' 
    else
      render :new
    end
  end

  def update
    if @kilometerdriven.update(kilometer_driven_params)
      redirect_to kilometer_drivens_path, notice: 'Kilometerdriven was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @kilometerdriven.destroy
    redirect_to kilometer_drivens_url, notice: 'Kilometerdriven was successfully destroyed.' 
  end

  private
  
  def set_kilometer_driven
    @kilometerdriven = KilometerDriven.find(params[:id])
  end

  def kilometer_driven_params
    params.require(:kilometer_driven).permit(:name)
  end
end
