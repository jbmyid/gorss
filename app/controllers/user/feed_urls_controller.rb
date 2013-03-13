class User::FeedUrlsController < User::BaseController
	def generate_feeds
    @feed_url = FeedUrl.find(params[:id])
    @feed_url.generate_feed
    redirect_to admin_feed_urls_path
  end

  def generate_all_feeds
  	FeedUrl.generate_all_feeds
  	redirect_to :back
  end
end
