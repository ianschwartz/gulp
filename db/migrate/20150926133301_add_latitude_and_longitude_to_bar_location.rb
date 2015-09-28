class AddLatitudeAndLongitudeToBarLocation < ActiveRecord::Migration
  def change
    add_column :bar_locations, :latitude, :float
    add_column :bar_locations, :longitude, :float
    add_column :bar_locations, :city, :string
    add_column :bar_locations, :state, :string
    add_column :outdoor_locations, :city, :string
    add_column :outdoor_locations, :state, :string
  end
end
