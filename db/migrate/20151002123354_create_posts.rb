class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body
      t.references :poster, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
