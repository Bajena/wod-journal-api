class FixWodsSchema < ActiveRecord::Migration[5.0]
  def change
    remove_column :wods, :date
    add_column :wods, :date, :date
  end
end
