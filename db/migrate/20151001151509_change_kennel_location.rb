class ChangeKennelLocation < ActiveRecord::Migration
  def up
    remove_column :kennels, :zipcode
    add_column :kennels, :location, :string
  end

  def down
    add_column :kennels, :zipcode, :integer
    remove_column :kennels, :location
  end
end
