class AddRulesToKennel < ActiveRecord::Migration
  def change
    add_column :kennels, :rules, :text
  end
end
