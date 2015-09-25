class RemoveColumnsFromLocation < ActiveRecord::Migration
  def up
    remove_column :locations, :city
    remove_column :locations, :state
    remove_column :locations, :latitude
    remove_column :locations, :longitude
  end

  def down
    add_column :locations, :city, :string
    add_column :locations, :state, :string
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end
end
