class AddPosttypeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :posttype, :string
  end
end
