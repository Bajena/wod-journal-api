# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Jan"
    last_name "Kowalski"
    email "jan.kowalski@wod.com"
    password "test1234"
    password_confirmation { password }
  end
end
