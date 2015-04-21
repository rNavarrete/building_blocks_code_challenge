class PagesController < ApplicationController
  def user_dashboard
    if current_user
      @user = current_user
    else
      redirect_to root_path
    end
  end
end
