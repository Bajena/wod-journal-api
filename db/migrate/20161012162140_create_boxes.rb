class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.string :name, null: false
      t.string :address
      t.string :country
      t.string :city
      t.string :postal_code
      t.timestamps
    end
  end
end
