class UserFeedUrl < ActiveRecord::Base
  belongs_to :feed_url
  belongs_to :user
  attr_accessible :user_id, :feed_url_id
end
