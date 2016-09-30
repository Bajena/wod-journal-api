class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  has_many :wods, foreign_key: :author_id, dependent: :destroy
  has_many :oauth_providers

  validates :email, presence: true
end
