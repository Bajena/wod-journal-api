# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :oauth_provider do
    provider "facebook"
    uid "1234"
    user
  end
end
