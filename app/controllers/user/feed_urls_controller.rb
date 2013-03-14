class User::FeedUrlsController < User::BaseController
  before_filter :find_feed_url, only: [:generate_feeds, :subscribe, :unsubscribe]
  def index
    @feed_urls = FeedUrl.page(params[:page]).per(10)
  end

  def create
    @feed_url = FeedUrl.new(params[:feed_url])
    @feed_url.save
  end

	def generate_feeds
    @feed_url.generate_feed
    redirect_to user_feed_urls_path
  end

  def subscribe
    current_user.subscribe(@feed_url)
  end

  def unsubscribe
    current_user.unsubscribe(@feed_url)
  end

  def generate_all_feeds
  	FeedUrl.generate_all_feeds
  	redirect_to user_dashboard_index_path
  end

  private
  def find_feed_url
    @feed_url = FeedUrl.find(params[:id])
  end
end

