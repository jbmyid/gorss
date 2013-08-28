require 'uri'

class Tab < ActiveRecord::Base
  attr_accessible :name, :url, :category_id

  validates :name, :url, presence: true
  validates :name, length:{maximum: 50}
  validate :valid_url?

  belongs_to :category
  belongs_to :user


	def valid_url?
	  uri = URI.parse(url)
	  self.errors[:url] << "is invalid url" unless uri.kind_of?(URI::HTTP)
	rescue URI::InvalidURIError
	  self.errors[:url] << "is invalid url"
	end
end
