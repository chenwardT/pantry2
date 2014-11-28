class CreateFoodTypes < ActiveRecord::Migration
  def change
    create_table :food_types do |t|
      t.column :name, :string
      t.index :name
    end
  end
end
