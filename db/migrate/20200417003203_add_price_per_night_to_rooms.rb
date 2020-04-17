class AddPricePerNightToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :price_per_night, :decimal
  end
end
