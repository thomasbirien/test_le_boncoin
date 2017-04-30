class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :price
      t.string :category
      t.string :item_name
      t.string :picture
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
