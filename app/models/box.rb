class Box < ApplicationRecord
  validates :name, uniqueness: true
end
