class AddStorageBooleanToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :in_freezer, :boolean
  end
end
