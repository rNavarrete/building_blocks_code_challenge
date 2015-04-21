class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_dashboard_path
    else
      redirect_to "/signup"
    end
  end

  def update
    if current_user
      current_user.update((params[:user].to_hash_object))
    else
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation, :desk_selection)
  end
end
