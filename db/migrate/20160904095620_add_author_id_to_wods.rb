class AddAuthorIdToWods < ActiveRecord::Migration[5.0]
  def change
    add_column :wods, :author_id, :integer
    add_foreign_key :wods, :users, column: :author_id, primary_key: :id
    add_index :wods, :author_id
  end
end
