class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.references :user
      t.string :name
      t.references :category
      t.text :url

      t.timestamps
    end
  end
end
