class Wod < ApplicationRecord
  enum goal_type: [:amrap, :for_time, :emom]
  has_many :wod_items

  belongs_to :author, class_name: "User"
end
