class CreateExpirationDates < ActiveRecord::Migration
  def change
    create_table :expiration_dates do |t|
      t.string :name
      t.boolean :is_opened
      t.boolean :is_cooked
      t.boolean :in_fridge
      t.boolean :in_freezer
      t.boolean :in_pantry
      t.integer :duration

      t.timestamps
    end
  end
end
