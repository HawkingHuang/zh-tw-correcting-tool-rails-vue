class LibrariesController < ApplicationController
  before_action :require_login

  def index
    if params[:category].present?
      @libraries = Library.where(bpmf_category: params[:category])
    else
      @libraries = Library.all
    end

    respond_to do |format|
      format.html
    end
  end
end
