class AddStateToKennel < ActiveRecord::Migration
  def change
    add_reference :kennels, :state, index: true, foreign_key: true
  end
end
