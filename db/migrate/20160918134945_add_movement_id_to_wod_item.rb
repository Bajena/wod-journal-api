class AddMovementIdToWodItem < ActiveRecord::Migration[5.0]
  def change
    add_column :wod_items, :movement_id, :integer, null: false
    add_foreign_key :wod_items, :movements
    add_index :wod_items, :movement_id
  end
end
