class User::DashboardController < User::BaseController
  def index
  	@feeds = Feed.limit(10)
  end
end
