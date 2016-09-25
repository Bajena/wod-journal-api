# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :doorkeeper_application, class: Doorkeeper::Application do
    uid "application"
    name "application"
    secret "app_secret"
    redirect_uri "https://uri.com"
  end
end
