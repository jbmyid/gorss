class Feed < ActiveRecord::Base
  belongs_to :feed_url
  attr_accessible :data

  serialize :data, RssParser::FeedEntry
end
