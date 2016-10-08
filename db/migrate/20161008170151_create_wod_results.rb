class CreateWodResults < ActiveRecord::Migration[5.0]
  def change
    create_table :wod_results do |t|
      t.belongs_to :wod, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :time_seconds
      t.integer :reps
      t.boolean :done, default: true
      t.boolean :scaled, default: false
    end
  end
end
