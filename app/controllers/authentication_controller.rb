class AuthenticationController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:notice] = 'Successfully signed in'
      redirect_to cheeses_path
    else
      flash[:notice] = 'User could not be authenticated. Please try again.'
      render :new
    end
  end
end
