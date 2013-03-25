class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  before_filter :check_current_user
  # layout :false
  def index
  end

  private
  def check_current_user
    redirect_to user_dashboard_index_path if current_user
  end
end
