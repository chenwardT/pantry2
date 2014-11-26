class AddIndexToIngredientsCreatedAt < ActiveRecord::Migration
  def change
    add_index :ingredients, :created_at
  end
end
