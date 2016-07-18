class CreateWodItems < ActiveRecord::Migration[5.0]
  def change
    create_table :wod_items do |t|
      t.references :wod, foreign_key: true
      t.integer :reps
      t.integer :weight_men
      t.integer :weight_women
      t.integer :time_seconds

      t.timestamps
    end
  end
end
