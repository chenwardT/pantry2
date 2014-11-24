class AddIndices < ActiveRecord::Migration
  def change
    add_index :ingredients, :user_id
    add_index :ingredients, :expiration_date_id
  end
end
