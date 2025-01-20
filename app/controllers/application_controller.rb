class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate?(user)
    user.present?
  end

  def require_login
    unless authenticate?(current_user)
      flash[:alert] = "請先登入"
      redirect_to login_path
    end
  end
end
