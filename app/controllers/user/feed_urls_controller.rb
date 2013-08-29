class User::FeedUrlsController < User::BaseController
  before_filter :find_feed_url, only: [:generate_feeds, :subscribe, :unsubscribe, :recolor]
  def index
    @feed_urls = FeedUrl.all #.page(params[:page]).per(10)
  end

  def new
    @feed_url = FeedUrl.new
  end

  def create
    @feed_url = FeedUrl.new(params[:feed_url])
    @feed_url.save
  end

	def generate_feeds
    @feed_url.generate_feed
    redirect_to user_dashboard_index_path
  end

  def subscribe
    current_user.subscribe(@feed_url)
    @feed_urls = FeedUrl.all #.page(params[:page]).per(10)
    respond_to do |format|
     format.html{redirect_to user_dashboard_index_path}
     format.js do 
        @feeds = current_user.subscribed_feeds.order("created_at DESC").limit(20)
     end
    end
  end

  def unsubscribe
    current_user.unsubscribe(@feed_url)
    respond_to do |format|
      format.html{redirect_to user_dashboard_index_path}
      format.js do 
        @feeds = current_user.subscribed_feeds.order("created_at DESC").limit(20)
      end
    end
  end

  def recolor
    @user_feed_url = current_user.user_feed_url.where(feed_url_id: @feed_url.id).last
    @user_feed_url.recolor("#"+params[:color])
  end

  def generate_all_feeds
  	FeedUrl.generate_all_feeds
    respond_to do |format|
  	 format.html{redirect_to user_dashboard_index_path}
     format.js do 
        @feeds = current_user.subscribed_feeds.order("created_at DESC").limit(20)
     end
    end
  end

  private
  def find_feed_url
    @feed_url = FeedUrl.find(params[:id])
  end
end

