class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end



  def new
    @user = User.new
  end


  def edit
  end

  def create
    @user = User.new(user_params)
      if @user.save
      UserMailer.registration_confirmation(@user).deliver
      #  session[:user_id] = @user.id
        redirect_to root_path, notice: 'Registration compleated pleasse confirm your account.' 
      else
        render :new
      end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:notice] = "Welcome ! Your email has been confirmed.
      Please sign in to continue."
      redirect_to root_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
end


  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.' 
      else
        format.html { render :edit }
      end
  end


  def destroy
    @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email,:password,:role_id)
    end
end