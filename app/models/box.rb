class Box < ApplicationRecord
  validates :name, uniqueness: true

  has_many :members, through: :box_memberships, source: :user
  has_many :coaches, through: :box_coaching_privileges, source: :user
  has_many :wods

  has_many :box_coaching_privileges
  has_many :box_memberships
end
