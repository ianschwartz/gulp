class CreateKennels < ActiveRecord::Migration
  def change
    create_table :kennels do |t|
      t.string :name
      t.integer :zipcode

      t.timestamps null: false
    end
  end
end
