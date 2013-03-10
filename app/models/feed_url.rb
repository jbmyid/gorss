class FeedUrl < ActiveRecord::Base

	STATUSES = {active: "ACTIVE", pending: "PENDING"}

  attr_accessible :description, :title, :url
  validates :url, uniqueness: true, presence: true, format: /http?:\/\/[\S]+/
  # validates :status, inclusion: {in: STATUSES.map{|i,v| v}}
  
  before_create :parse_rss
  # validate :parsable?

  has_many :feeds

  STATUSES.each do |method_name, value|
		define_method method_name.to_s+"?" do 
			status == value
		end  	
  end


  def activate
  	self.status= STATUSES[:active]
  	save
  end

  def deactivate
  	self.status= STATUSES[:pending]
  	save!
  end

  def generate_feed
  	feed = RssParser::RssFeed.parse_rss_url(url)
    if feed
    	feed.entries.each do |e|
        old_f = feeds.where("guid=?",(e.entry_id || e.link)).first
    		new_f = feeds.build(data: e) unless old_f
        new_f.save if new_f
    	end
    	# save
    end
  end

  private

  def parse_rss
  	feed = RssParser::RssFeed.parse_rss_url(url)
  	unless feed
  		errors[:url] << "not able to parse."
  	else
  		self.title = feed.title
  		self.description = feed.description
  		self.status = STATUSES[:pending]
  	end
  end

end
