class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:user_email])
    if user && user.authenticate(params[:session][:password])
      admin_or_user(user)
    end
  end

  def admin_or_user(user)
    session[:user_id] = user.id
    if user.admin == true
      redirect_to admin_dashboard_path
    else
      redirect_to user_dashboard_path
    end
  end
end
