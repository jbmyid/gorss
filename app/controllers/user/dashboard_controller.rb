class User::DashboardController < User::BaseController
  def index
  	@feeds = current_user.subscribed_feeds.order("created_at DESC").page(params[:page]).per(20)
  	respond_to do |format|
  		format.html
  		format.js
    end
  end
end
