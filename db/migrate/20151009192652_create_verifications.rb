class CreateVerifications < ActiveRecord::Migration
  def change
    create_table :verifications do |t|
      t.integer :verifier_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :verifications, [:verifier_id, :user_id], unique: true
  end
end