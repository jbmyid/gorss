class UserFeedUrl < ActiveRecord::Base
  belongs_to :feed_url
  belongs_to :user
  attr_accessible :user_id, :feed_url_id, :color
  serialize :color #, FeedColor

  def recolor(clr)
    cl = FeedColor.new(clr)
    update_attribute(:color, cl )
  end
end
