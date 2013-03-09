class AddStatusToFeedUrls < ActiveRecord::Migration
  def change
    add_column :feed_urls, :status, :string
  end
end
