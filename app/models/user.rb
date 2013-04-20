class User < Person
	devise :registerable, :omniauthable, :omniauth_providers => [:facebook]
  has_many :user_feed_url
  has_many :feed_urls, through: :user_feed_url


  def subscribe(feed_url)
    sub =user_feed_url.build(feed_url_id: feed_url.id)
    sub.save
  end

  def unsubscribe(feed_url)
    user_feed_url.find_by_feed_url_id(feed_url.id).try(:destroy)
  end

  def generate_feeds
    objs = []
    urls = feed_urls.where("status=?",STATUSES[:active])
    urls.each do |u|
      feed = RssParser::RssFeed.parse_rss_url(u.url)
      feed.entries.each do |e|
        old_f = Feed.where("guid=?",(e.entry_id || e.link)).first
        new_f = u.feeds.build(data: e) unless old_f
        objs << new_f if new_f
      end
    end
    objs.shuffle!
    objs.each do |f|
      f.save
    end
  end

  # 1 -- 10
  # 2 -- 11 20
  def subscribed_feeds
    # page = page ? page.to_i : 1
    # limit = 10
    # off = (page-1) * limit

    urls = feed_urls.where("status=?",FeedUrl::STATUSES[:active]).select("feed_urls.id")
    Feed.joins("LEFT JOIN user_feed_urls ON feeds.feed_url_id=user_feed_urls.feed_url_id").select("distinct feeds.id, feeds.*, user_feed_urls.color").where("feeds.feed_url_id in (?)", urls.map(&:id))

  end

  def subscribed_feed_urls
    # user_feed_urls.joins(:feed_urls).select("")
    # feed_urls.joins(:user_feed_url).select("feed_urls.*, user_feed_urls.color")#.uniq("feed_urls.id")
    feed_urls.joins(:user_feed_url).select(" distinct feed_urls.id, feed_urls.*, user_feed_urls.color")#.uniq("feed_urls.id")
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    user
  end
end