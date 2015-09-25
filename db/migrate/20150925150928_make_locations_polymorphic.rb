class MakeLocationsPolymorphic < ActiveRecord::Migration
  def up
    remove_column :locations, :address
    add_column :locations, :place_type, :string
    add_column :locations, :place_id, :string
    add_index :locations, [:place_id, :place_type]
  end

  def down
    add_column :locations, :address, :string
    remove_column :locations, :place_type
    remove_column :locations, :place_id
    remove_index :locations, [:place_id, :place_type]
  end
end
