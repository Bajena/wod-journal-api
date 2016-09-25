# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doorkeeper_token, class: Doorkeeper::AccessToken do
    token "secret-token"
  end
end
