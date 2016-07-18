class Wod < ApplicationRecord
  enum goal_type: [:amrap, :for_time]
  has_many :wod_items
end
