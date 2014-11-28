class ConvertExpirationdateToNewStyle < ActiveRecord::Migration
  def change
    change_table(:expiration_dates) do |t|
      t.remove :in_pantry, :in_freezer, :in_fridge, :is_cooked, :is_opened
      t.rename :duration, :fridge_duration
      t.column :freezer_duration, :integer
      t.column :comments, :string
      t.column :food_type_id, :integer
    end

    add_index :expiration_dates, :food_type_id
  end
end
