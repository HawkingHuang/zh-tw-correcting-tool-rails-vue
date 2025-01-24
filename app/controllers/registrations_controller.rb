class RegistrationsController < ApplicationController
  def new
    @user = User.new
    render :signup
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to check_index_path, notice: "Sign up successfully!"
    else
      render :signup
    end
  end

  def user_params
    params.permit(:email, :username, :password)
  end
end
