class ReportsController < ApplicationController
  def index
    @reports = Report.order(created_at: :desc)

    if params[:keyword].present?
      @reports = @reports.where("correct_word LIKE ? OR incorrect_word LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end   
  end

  def new
    @report = Report.new
    @report.replies.build
  end

  def create
    @report = Report.new(report_params.merge(username: current_user.username))
  
    if @report.save
      reply = @report.replies.create(response: params[:report][:response], username: current_user.username)
      
      if reply.save
        render json: { state: 0 }
        flash[:notice] = "Report and first response successfully created!"
      else
        flash[:alert] = "Failed to create first response. Please check your input."
        render :new
      end
    else
      flash[:alert] = "Failed to create report. Please check your input."
      render :new
    end
  end
  

  def edit
    @report = Report.find(params[:id])
    @replies = @report.replies
  end

  def update
    @report = Report.find(params[:id])
  
    reply = @report.replies.create(response: params[:report][:response], username: current_user.username)
  
    if reply.save
      render json: { state: 0 }
      flash[:notice] = "Response successfully added!"
    else
      flash[:alert] = "Failed to add response."
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
    params.require(:report).permit(:correct_word, :incorrect_word, :response)
  end
end
