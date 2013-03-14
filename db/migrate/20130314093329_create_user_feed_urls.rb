class CreateUserFeedUrls < ActiveRecord::Migration
  def change
    create_table :user_feed_urls do |t|
      t.references :feed_url
      t.references :user

      t.timestamps
    end
    add_index :user_feed_urls, :feed_url_id
    add_index :user_feed_urls, :user_id
  end
end
