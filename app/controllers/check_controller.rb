class CheckController < ApplicationController
  before_action :require_login
  def index
    @libraries = Library.all
    @customs = current_user.customs

    @all_words = @libraries + @customs
  end

  def examine
  end
end
