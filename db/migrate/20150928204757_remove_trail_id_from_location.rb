class RemoveTrailIdFromLocation < ActiveRecord::Migration
  def up
    remove_reference :locations, :trail
  end

  def down
    add_reference :locations, :trail, index: true, foreign_key: true
  end
end
