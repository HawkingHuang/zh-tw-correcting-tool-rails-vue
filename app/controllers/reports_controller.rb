class ReportsController < ApplicationController
  def index
    @reports = Report.order(created_at: :desc)
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)

    if @report.save
      redirect_to reports_path, notice: "Report successfully created!"
    else
      flash[:alert] = "Failed to create report. Please check your input."
      render :new
    end
  end

  # 編輯回報（回覆功能）
  def edit
    @report = Report.find(params[:id])
  end

  # 更新回報（添加回覆）
  def update
    @report = Report.find(params[:id])

    if @report.update(response: params[:report][:response])
      redirect_to reports_path, notice: "Response successfully updated!"
    else
      flash[:alert] = "Failed to update response."
      render :edit
    end
  end

  def words
    category = params[:category]
    
    if category.present?
      words = Library.where(bpmf_category: category).select(:correct_word, :incorrect_word)
      render json: words
    else
      render json: { error: "Category not provided" }, status: :bad_request
    end
  end

  private

  def report_params
    params.require(:report).permit(:username, :correct_word, :incorrect_word, :response)
  end
end
