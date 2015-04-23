class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:user_email])
    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_based_on_authorization(user)
    else
      flash[:error] = "Something went wrong, try again."
      redirect_to root_path
    end
  end

end
