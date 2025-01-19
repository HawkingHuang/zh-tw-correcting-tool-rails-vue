class SessionsController < ApplicationController
  def new
    render :login
  end

  def create
    user = User.find_by(username: params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to about_path, notice: '登入成功！'
    else
      flash[:alert] = '帳號或密碼不正確'
      render :login
    end
  end
  

  def destroy
  end
end
