class SessionsController < ApplicationController
  protect_from_forgery with: :null_session
    def create
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

  def destroy
    session.clear
    redirect_to '/', notice: "You have successfully logged out"
  end
end
