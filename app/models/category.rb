class Category < ActiveRecord::Base
  attr_accessible :name, :color
  serialize :color#, FeedColor
  validates :name, presence: true,length:{maximum: 50}, uniqueness: {scope: :user_id}
  belongs_to :user
  has_many :tabs
  
  def recolor(clr)
    cl = FeedColor.new(clr)
    update_attribute(:color, cl )
  end
end
