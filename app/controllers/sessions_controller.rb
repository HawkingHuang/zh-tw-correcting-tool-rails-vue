class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:new, :create]
  def new
    render :login
  end

  def create
    user = User.find_by(username: params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to about_index_path, notice: "Log in successfully!"
    else
      flash[:alert] = "Invalid username or password"
      render :login
    end
  end
  

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Log out successfully!"
  end

  private

  def redirect_if_authenticated
    if session[:user_id].present?
      redirect_to about_index_path, alert: "You are already logged in!"
    end
  end
end
