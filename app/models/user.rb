class User < Person
	devise :registerable
  has_many :user_feed_url
  has_many :feed_urls, through: :user_feed_url


  def subscribe(feed_url)
    sub =user_feed_url.build(feed_url_id: feed_url.id)
    sub.save
  end

  def unsubscribe(feed_url)
    user_feed_url.find_by_id(feed_url.id).try(:destroy)
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

  def subscribed_feeds
    urls = feed_urls.where("status=?",FeedUrl::STATUSES[:active]).select("feed_urls.id")
    Feed.where("feed_url_id in (?)", urls.map(&:id))
  end
end