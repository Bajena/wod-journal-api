# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  require "devise/orm/active_record"
  config.stretches = Rails.env.test? ? 1 : 11
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
end
