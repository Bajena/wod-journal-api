class WodItem < ApplicationRecord
  belongs_to :wod
  belongs_to :movement
end
