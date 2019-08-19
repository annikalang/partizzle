class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :title
      t.text :description
      t.integer :size
      t.integer :price
      t.text :tags, array: true, default: []
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
