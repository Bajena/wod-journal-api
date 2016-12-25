class AddBoxIdToWods < ActiveRecord::Migration[5.0]
  def change
    add_column :wods, :box_id, :integer
    add_foreign_key :wods, :boxes, column: :box_id
    add_index :wods, :box_id
  end
end
