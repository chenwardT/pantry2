class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :expiration_date_id
      t.integer :user_id
      t.datetime :purchase_date

      t.timestamps
    end
  end
end
