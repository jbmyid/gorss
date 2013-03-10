class User::DashboardController < User::BaseController
  def index
  	@feeds = Feed.order("created_at DESC").page(params[:page]).per(20)
  	respond_to do |format|
  		format.html
  		format.js
    end
  end
end
