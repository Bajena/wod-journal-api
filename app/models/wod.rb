class Wod < ApplicationRecord
  GOAL_TYPES = %w(amrap for_time emom).freeze

  has_many :wod_items, dependent: :delete_all
  belongs_to :author, class_name: "User"
  belongs_to :preset_wod, class_name: "Wod"
  belongs_to :box

  enum goal_type: GOAL_TYPES

  validates :goal_type, inclusion: { in: GOAL_TYPES }
  validates :wod_items, presence: true
  validates :title, uniqueness: { if: :preset? }
end
