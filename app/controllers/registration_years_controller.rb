class RegistrationYearsController < ApplicationController
  before_action :require_admin
  before_action :require_login

  def index
    @registration_years = RegistrationYear.all
  end
end