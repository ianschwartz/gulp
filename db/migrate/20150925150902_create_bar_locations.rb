class CreateBarLocations < ActiveRecord::Migration
  def change
    create_table :bar_locations do |t|
      t.string :name
      t.string :address

      t.timestamps null: false
    end
  end
end
