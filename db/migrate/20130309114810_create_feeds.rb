class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
    	t.string :guid
      t.text :data
      t.references :feed_url

      t.timestamps
    end
    add_index :feeds, :feed_url_id
  end
end
