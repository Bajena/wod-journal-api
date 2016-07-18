class CreateExcercises < ActiveRecord::Migration[5.0]
  def change
    create_table :excercises do |t|
      t.string :name
      t.integer :default_kg_men
      t.integer :default_kg_women
      t.integer :default_reps

      t.timestamps
    end
  end
end
