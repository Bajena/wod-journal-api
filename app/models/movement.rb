class Movement < ApplicationRecord
  validates :name, uniqueness: true
end
