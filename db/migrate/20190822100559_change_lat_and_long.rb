class ChangeLatAndLong < ActiveRecord::Migration[5.2]
  def change
        rename_column :locations, :location_lat, :latitude
        rename_column :locations, :location_lng, :longitude
  end
end
