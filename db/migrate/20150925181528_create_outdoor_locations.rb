class CreateOutdoorLocations < ActiveRecord::Migration
  def change
    create_table :outdoor_locations do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
    end
  end
end
