class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  def authorized_user
    redirect_to request.referer || root_path, alert: "You cannot access this page" unless logged_in? && current_user.id == params[:id].to_i
  end

  # def authorized_delete
  #   redirect_back(fallback_location: root_path), alert: "You cannot delete this" unless current_user.delete(self)
  # end
end
