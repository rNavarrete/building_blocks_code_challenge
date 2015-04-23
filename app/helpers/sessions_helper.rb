module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def redirect_based_on_authorization(user)
    if user.admin == true
      redirect_to admin_dashboard_path
    else
      redirect_to user_dashboard_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
