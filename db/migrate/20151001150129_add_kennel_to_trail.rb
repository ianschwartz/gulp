class AddKennelToTrail < ActiveRecord::Migration
  def change
    add_reference :trails, :kennel, index: true, foreign_key: true
  end
end
