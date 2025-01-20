class CustomsController < ApplicationController
  before_action :require_login
  before_action :set_custom, only: [:edit, :update]

  def index
    @customs = current_user.customs
  end

  def new
    @custom = current_user.customs.new
  end

  def create
    @custom = current_user.customs.new(custom_params)
    if @custom.save
      render json: { state: 0 }
      flash[:notice] = "Custom word added successfully!"
    else
      render json: { state: -1, message: @custom.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end

  def edit
    if @custom.nil? || @custom.user != current_user
      redirect_to customs_path, alert: "You are not authorized to edit this custom word."
    end
  end

  def update
    if @custom.nil? || @custom.user != current_user
      redirect_to customs_path, alert: "You are not authorized to update this custom word."
    elsif @custom.update(custom_params)
      render json: { state: 0 }
      flash[:notice] = "Custom word updated successfully!"
    else
      render :edit
    end
  end

  def set_custom
    @custom = current_user.customs.find_by(id: params[:id])
  end

  def custom_params
    params.permit(:correct_word, :incorrect_word)
  end
end
