class AddLocationLatToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :location_lat, :decimal
  end
end
