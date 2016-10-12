class User < ApplicationRecord
  has_secure_password

  has_many :wods, foreign_key: :author_id, dependent: :destroy
  has_many :oauth_providers
  has_many :wod_results, dependent: :destroy
  has_many :coached_boxes, through: :box_coaching_privileges, source: :box
  has_many :boxes, through: :box_memberships

  has_many :box_coaching_privileges
  has_many :box_memberships

  validates :email, presence: true, email: true, uniqueness: true
  validates :password, length: { within: (6..40) }
end
