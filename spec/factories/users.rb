# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Jan"
    last_name "Kowalski"
    email "jan.kowalski@wod.com"
  end
end
