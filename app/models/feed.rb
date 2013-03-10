class Feed < ActiveRecord::Base
  belongs_to :feed_url
  attr_accessible :data

  serialize :data, RssParser::FeedEntry

  validates :guid, uniqueness: true, presence: true
  validates :data, :feed_url_id, presence: true

  before_validation :set_default

  private

  def set_default
  	self.guid = data.entry_id || data.link
  end

end
