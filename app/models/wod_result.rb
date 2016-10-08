class WodResult < ApplicationRecord
  belongs_to :wod
  belongs_to :user

  validates :wod, presence: true
  validates :user, presence: true

  validate :match_wod_goal

  private

  def match_wod_goal
    return unless wod

    if wod.amrap?
      errors.add(:time_seconds, :blank) if time_seconds.present?
    elsif wod.for_time?
      errors.add(:reps, :blank) if reps.present?
    end
  end
end
