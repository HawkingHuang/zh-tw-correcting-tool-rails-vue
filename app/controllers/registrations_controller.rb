class RegistrationsController < ApplicationController
  def new
    @user = User.new
    render :signup
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to about_path, notice: '註冊成功！'
    else
      render :signup
    end
  end

  def user_params
    params.permit(:email, :username, :password)
  end
end
