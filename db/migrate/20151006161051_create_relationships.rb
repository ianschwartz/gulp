class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :followable, polymorphic: true, index: true
      t.belongs_to :user, index: true, foreign_key: true
    end
  end
end
