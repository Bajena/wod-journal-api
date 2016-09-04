class Wod < ApplicationRecord
  GOAL_TYPES = %w(amrap for_time emom).freeze

  has_many :wod_items
  belongs_to :author, class_name: "User"

  enum goal_type: GOAL_TYPES

  validates :goal_type, inclusion: { in: GOAL_TYPES }
end
