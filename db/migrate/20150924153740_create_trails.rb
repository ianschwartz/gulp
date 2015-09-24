class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.datetime :start

      t.timestamps null: false
    end
  end
end
