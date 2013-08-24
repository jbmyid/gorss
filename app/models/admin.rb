class Admin < Person
	has_many :user_feed_url, foreign_key: :user_id
  	has_many :feed_urls, through: :user_feed_url

  def subscribed_feeds
    # page = page ? page.to_i : 1
    # limit = 10
    # off = (page-1) * limit + 1

    urls = feed_urls.where("status=?",FeedUrl::STATUSES[:active]).select("feed_urls.id")
     # urls = feed_urls.where("status=?",FeedUrl::STATUSES[:active]).pluck("feed_urls.id").join(",")
    # Feed.find_by_sql("Select distinct f.id, f.*, u.color,u.id as u_id from user_feed_urls u LEFT JOIN feeds f ON f.feed_url_id=u.feed_url_id where u.user_id = #{self.id} and u.feed_url_id in (#{urls}) ORDER BY f.created_at DESC LIMIT #{limit}  OFFSET #{off}")
    Feed.joins("LEFT JOIN user_feed_urls ON feeds.feed_url_id=user_feed_urls.feed_url_id LEFT JOIN feed_urls fu ON fu.id=feeds.feed_url_id").select("distinct feeds.*, user_feed_urls.color, fu.title as url_title").where("feeds.feed_url_id in (?) and user_feed_urls.user_id=?", urls.map(&:id),self.id)
  end

  def feed_urls
    FeedUrl.joins("LEFT JOIN user_feed_urls ufu ON ufu.feed_url_id=feed_urls.id && ufu.user_id=#{self.id}").select("feed_urls.*, ufu.color").uniq("feed_urls.id, ufu.")
  end
end