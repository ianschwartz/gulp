class AddFieldsToBarLocation < ActiveRecord::Migration
  def change
    add_column :bar_locations, :contact, :string
    add_column :bar_locations, :phone, :string
    add_column :bar_locations, :email, :string
    add_column :bar_locations, :beer, :string
    add_column :bar_locations, :format, :string
    add_column :bar_locations, :price, :integer
  end
end
