
class RegistrationStatesController < ApplicationController
  before_action :set_registration_state, only: [ :edit, :update, :destroy]
  before_action :require_login 
  before_action :require_admin

  def index
    @registrationstates = RegistrationState.all
  end

  def new
    @registrationstate = RegistrationState.new
  end

  def edit
  end

  def create
    @registrationstate = RegistrationState.new(registration_state_params)

    if @registrationstate.save
      redirect_to registration_states_path, notice: 'RegistrationState was successfully created.' 
    else
      render :new 
    end
  end

  def update
    if @registrationstate.update(registration_state_params)
      redirect_to registration_states_path, notice: 'RegistrationState was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @registrationstate.destroy

    redirect_to registration_states_url, notice: 'RegistrationState was successfully destroyed.' 
  end



  private

    def set_registration_state
      @registrationstate = RegistrationState.find(params[:id])
    end

    def registration_state_params
      params.require(:registration_state).permit(:name)
    end
end
