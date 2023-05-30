class RenameColumnInHouses < ActiveRecord::Migration[7.0]
  def change
    rename_column :houses, :type, :house_type
  end
end
