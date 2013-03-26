class Feed < ActiveRecord::Base
  belongs_to :feed_url
  attr_accessible :data

  serialize :data, RssParser::FeedEntry

  validates :guid, uniqueness: true, presence: true
  validates :data, :feed_url_id, presence: true

  before_validation :set_default


  def media_image
    return data.media_image if data.media_image.present?
    html = Nokogiri::HTML(data.description)
    image = html.css("img").select{|i| i.attributes["width"].value.to_i>50 && i.attributes["height"].value.to_i>50 }
    # (html.css("img").first && html.css("img").first.attributes["width"]>50 && html.css("img").first.attributes["height"]>50) ? html.css("img").first.attributes["src"].value : ""      
    image.present? ? image.first.attributes["src"].value  : "#"
  end

  private

  def set_default
  	self.guid = data.entry_id || data.link
  end

end
