class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.belongs_to :trail, index: true, foreign_key: true
      t.belongs_to :location, index: true, foreign_key: true
      t.string :type

      t.timestamps null: false
    end
  end
end
