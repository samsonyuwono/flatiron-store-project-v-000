class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
     @user= (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    !!current_user
  end

  def require_login
    if current_user.nil?
      redirect_to store_path
    end
  end


  helper_method :logged_in?
  helper_method :current_user
end
