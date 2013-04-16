class AddColorToUserFeedUrls < ActiveRecord::Migration
  def change
    add_column :user_feed_urls, :color, :string
  end
end
