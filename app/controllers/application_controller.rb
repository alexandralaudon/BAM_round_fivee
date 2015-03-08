class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :ensure_current_user

  def ensure_current_user
    unless session[:user_id].present?
      flash[:notice] = 'You must register or log in before you can do that!'
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

end
