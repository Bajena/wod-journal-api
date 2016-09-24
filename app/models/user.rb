class User < ApplicationRecord
  has_many :wods, foreign_key: :author_id, dependent: :destroy

  validates :email, presence: true
end
