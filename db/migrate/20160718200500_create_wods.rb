class CreateWods < ActiveRecord::Migration[5.0]
  def change
    create_table :wods do |t|
      t.text :comment
      t.string :date
      t.integer :timecap_seconds
      t.string :type, null: false
      t.string :name
      t.boolean :private, default: true

      t.timestamps
    end
  end
end
