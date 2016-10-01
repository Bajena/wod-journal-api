class AddBenchmarkWodIdAndBenchmarkToWods < ActiveRecord::Migration[5.0]
  def change
    add_column :wods, :preset_wod_id, :integer, index: true
    add_column :wods, :preset, :boolean, null: false, default: false
  end
end
