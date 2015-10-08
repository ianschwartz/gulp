class RemoveLatitudeAndLongitudeFromLocation < ActiveRecord::Migration
  def up
    remove_column :locations, :latitude
    remove_column :locations, :longitude
  end
  def down
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end
end
