class AddLocationsToTrails < ActiveRecord::Migration
  def change
    add_reference :locations, :trail, index: true, foreign_key: true
  end
end
