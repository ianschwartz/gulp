class ChangeTypeInCheckToADifferentName < ActiveRecord::Migration
  def up
    remove_column :checks, :type
    add_column :checks, :checktype, :string
  end

  def down
    remove_column :checks, :checktype
    add_column :checks, :type, :string
  end
end
