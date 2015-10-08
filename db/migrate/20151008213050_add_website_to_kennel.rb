class AddWebsiteToKennel < ActiveRecord::Migration
  def change
    add_column :kennels, :website, :string
  end
end
