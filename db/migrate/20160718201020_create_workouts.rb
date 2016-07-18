class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.references :wod, foreign_key: true, null: true
      t.string :title
      t.text :comment
      t.integer :duration_seconds
      t.integer :total_reps
      t.boolean :completed

      t.timestamps
    end
  end
end
