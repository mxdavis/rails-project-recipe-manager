class UsersController < ApplicationController
  before_filter :authorized, except: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "You have successfully signed up"
    else
      flash[:alert] = @user.errors.full_messages.join(", ").downcase
      render 'new'
    end
  end

  def edit
    @user = find_user_by_id
  end

  def update
    @user = find_user_by_id
    redirect_to request.referer || root_path, alert: "You cannot update this user" unless current_user.edit?(@user)
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have successfully updated #{@user.name}"
    else
      flash[:alert] = @user.errors.full_messages.join(", ").downcase
      render :edit
    end
  end

  private

  def find_user_by_id
    User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :admin)
  end
end
