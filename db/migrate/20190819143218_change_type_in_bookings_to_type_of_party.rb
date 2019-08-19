class ChangeTypeInBookingsToTypeOfParty < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :type, :type_of_party
  end
end
