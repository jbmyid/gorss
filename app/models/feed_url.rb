class FeedUrl < ActiveRecord::Base
  attr_accessible :description, :title, :url
  validates :url, uniqueness: true, presence: true, format: /http?:\/\/[\S]+/
  
end
