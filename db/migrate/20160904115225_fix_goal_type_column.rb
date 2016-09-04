class FixGoalTypeColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :wods, :goal_type
    add_column :wods, :goal_type, :integer
  end
end
