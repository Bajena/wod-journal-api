class RenameExcercisesToMovements < ActiveRecord::Migration[5.0]
  def change
    rename_table :excercises, :movements
  end
end
