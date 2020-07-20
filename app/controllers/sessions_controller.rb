class SessionsController < ApplicationController
    def new

    end

    def create 
        user = User.find_by(email: params[:session][:email].downcase)
        if(user && user.authenticate(params[:session][:password]))
            if user.email_confirm
              session[:user_id] = user.id
              redirect_to root_path 
              flash[:notice]  ='you have successfully logged in'
            else
              redirect_to root_path
              flash[:error] = 'please verify your account'
            end

        else
            redirect_to login_path
             flash[:error] = 'Email or password is not correct'
        end

    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You have logged out"
        redirect_to root_path

    end
end