class CreateJoinTableBoxUser < ActiveRecord::Migration[5.0]
  def change
    create_table :box_memberships do |t|
      t.belongs_to :box, null: false
      t.belongs_to :user, null: false
      t.index [:box_id, :user_id], unique: true
      t.timestamps
    end
  end
end
