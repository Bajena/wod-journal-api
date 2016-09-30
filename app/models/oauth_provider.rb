class OauthProvider < ApplicationRecord
  VALID_PROVIDERS = %w(facebook).freeze

  belongs_to :user

  validates :provider, inclusion: { in: VALID_PROVIDERS }
end
