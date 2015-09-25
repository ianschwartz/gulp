class RemoveTimestampsFromBarLocation < ActiveRecord::Migration
  def up
    remove_column :bar_locations, :created_at
    remove_column :bar_locations, :updated_at
  end

  def down
    add_column :bar_locations, :datetime
    add_column :bar_locations, :datetime
  end
end
