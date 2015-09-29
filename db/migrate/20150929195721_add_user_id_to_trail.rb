class AddUserIdToTrail < ActiveRecord::Migration
  def change
    add_reference :trails, :user, index: true, foreign_key: true
  end
end
