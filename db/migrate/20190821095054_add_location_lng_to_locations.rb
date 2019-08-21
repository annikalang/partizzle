class AddLocationLngToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :location_lng, :decimal
  end
end
