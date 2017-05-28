class SessionsController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    if request.env["omniauth.auth"].present?
      user = User.find_or_initialize_by(name: request.env["omniauth.auth"]['info']['name'])
      if user.id.present?
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "You have successfully logged in"
      else
        user.password = SecureRandom.hex
        user.save
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "You have successfully logged in"
      end
    end
    
    if params[:name].present?
      user = User.find_by_name(params[:name])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "You have successfully logged in"
      else
       if user
          flash[:alert] = "Your password is not correct"
        else 
          flash[:alert] = "The username is invalid"
       end
        render 'new'
      end
    end
  end

  def destroy
    session.clear
    redirect_to '/', notice: "You have successfully logged out"
  end
end
