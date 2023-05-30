class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :location
      t.string :type
      t.integer :bedrooms
      t.integer :guests
      t.integer :price

      t.timestamps
    end
  end
end
