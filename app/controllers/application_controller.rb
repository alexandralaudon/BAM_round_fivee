class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find(session[:user_id])
    else
      flash[:notice] = 'You must register or log in before you can do that!'
      redirect_to root_path
    end
  end
end
