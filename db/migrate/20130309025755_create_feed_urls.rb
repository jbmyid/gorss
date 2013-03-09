class CreateFeedUrls < ActiveRecord::Migration
  def change
    create_table :feed_urls do |t|
      t.string :title
      t.text :url
      t.text :description
      # t.integer :user_id
      t.timestamps
    end
  end
end
