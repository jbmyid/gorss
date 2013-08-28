class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :user
      t.text :color
      t.string :name

      t.timestamps
    end
  end
end
