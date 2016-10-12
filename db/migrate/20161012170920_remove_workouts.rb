class RemoveWorkouts < ActiveRecord::Migration[5.0]
  def change
    drop_table :workouts
  end
end
