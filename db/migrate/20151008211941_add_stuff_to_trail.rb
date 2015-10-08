class AddStuffToTrail < ActiveRecord::Migration
  def change
    add_column :trails, :price, :integer
    add_column :trails, :description, :text
  end
end
