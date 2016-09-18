class AddRoundsToWods < ActiveRecord::Migration[5.0]
  def change
    add_column :wods, :rounds, :integer
  end
end
