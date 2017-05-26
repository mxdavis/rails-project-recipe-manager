class AdminController < ApplicationController
  before_filter :authorized_admin

  def index
    @users = User.all
  end
end
