class User < ApplicationRecord
  has_secure_password

  has_many :wods, foreign_key: :author_id, dependent: :destroy
  has_many :oauth_providers

  validates :email, presence: true, email: true, uniqueness: true
  validates :password, length: { within: (6..40) }
end
