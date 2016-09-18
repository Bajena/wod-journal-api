class RenameWodItemFields < ActiveRecord::Migration[5.0]
  def change
    rename_column :wod_items, :weight_men, :men_weight_kg
    rename_column :wod_items, :weight_women, :women_weight_kg
  end
end
